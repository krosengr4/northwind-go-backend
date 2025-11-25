package handler

import (
	"encoding/json"
	"net/http"
	appconfig "northwind-api/internal/config"
	"northwind-api/internal/repository"
	"strconv"
	"strings"

	"github.com/gorilla/mux"
	"github.com/rs/zerolog/log"
)

type Handler struct {
	db     *repository.DB
	config *appconfig.Config
}

// Create a new instance of handler
func New(db *repository.DB, cfg *appconfig.Config) *Handler {
	return &Handler{
		db:     db,
		config: cfg,
	}
}

// Represents an error response
type ErrorResponse struct {
	Error string `json:"error"`
}

// Writes a JSON response
func writeJSONResponse(w http.ResponseWriter, status int, data interface{}) {
	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(status)
	if err := json.NewEncoder(w).Encode(data); err != nil {
		log.Error().Err(err).Msg("Error encoding JSON response")
	}
}

// Writes an error response
func writeErrorResponse(w http.ResponseWriter, status int, message string) {
	log.Warn().Int("status", status).Str("message", message).Msg("Writing error response")
	writeJSONResponse(w, status, ErrorResponse{Error: message})
}

// Handler to get all categories
func (h *Handler) GetCategories(w http.ResponseWriter, r *http.Request) {
	log.Info().Msg("GET /categories - Getting all of the categories")

	categories, err := h.db.GetAllCategories()
	if err != nil {
		log.Error().Err(err).Msg("Error getting categories")
		writeErrorResponse(w, http.StatusInternalServerError, "Failed to get categories")
		return
	}

	log.Info().Int("count", len(categories)).Msg("Successfully retrieved categories")
	writeJSONResponse(w, http.StatusOK, categories)
}

// #region Categories

// Handler to get category by its ID
func (h *Handler) GetCategoryById(w http.ResponseWriter, r *http.Request) {
	// Extract the ID from the URL path
	vars := mux.Vars(r)
	idStr := vars["categoryId"]

	log.Info().Str("category_id", idStr).Msg("GET /api/categories/{ID} - Getting category by ID")

	// Convert string to an int
	id, err := strconv.Atoi(idStr)
	if err != nil {
		log.Warn().Str("id", idStr).Msg("Invalid category ID format")
		writeErrorResponse(w, http.StatusInternalServerError, "Invalid category ID")
		return
	}

	// Get category from the database
	category, err := h.db.GetCategoryById(id)
	if err != nil {
		if err.Error() == "category not found" {
			log.Warn().Int("ID", id).Msg("Category not found")
			writeErrorResponse(w, http.StatusInternalServerError, "Category not found")
			return
		}
		log.Error().Err(err).Msg("Error getting categories")
		writeErrorResponse(w, http.StatusInternalServerError, "Failed to get that category")
		return
	}

	log.Info().Int("ID", id).Msg("Successfully retrieved the category")
	writeJSONResponse(w, http.StatusOK, category)
}

// Handler to create a new category
func (h *Handler) CreateCategory(w http.ResponseWriter, r *http.Request) {
	// Struct for request category info
	var req struct {
		Name        string `json:"category_name"`
		Description string `json:"description"`
	}

	// Decode the json and put into struct
	if err := json.NewDecoder(r.Body).Decode(&req); err != nil {
		log.Error().Err(err).Msg("Invalid JSON in create category request")
		writeErrorResponse(w, http.StatusBadRequest, "Invalid JSON: "+err.Error())
		return
	}

	log.Info().
		Str("category_name", req.Name).
		Str("description", req.Description).
		Msg("Creating category with data")

		// If name or description is empty, write error
	if req.Name == "" || req.Description == "" {
		log.Warn().Str("name", req.Name).Str("description", req.Description).Msg("Missing required fields")
		writeErrorResponse(w, http.StatusBadRequest, "category_name and description are required")
		return
	}

	// Create new category in the database
	catId, err := h.db.CreateNewCategory(req.Name, req.Description)
	if err != nil {
		if strings.Contains(err.Error(), "already exists") {
			log.Warn().Str("name", req.Name).Msg("This category already exists")
			writeErrorResponse(w, http.StatusConflict, err.Error())
			return
		}
		log.Error().Err(err).Str("name", req.Name).Msg("Error creating new category")
		writeErrorResponse(w, http.StatusInternalServerError, "Failed to create new category")
		return
	}

	log.Info().
		Int("category_id", catId).
		Str("category_name", req.Name).
		Str("description", req.Description).
		Msg("Successfully created new category")

	response := map[string]interface{}{
		"id":      catId,
		"message": "Category created successfully",
	}

	writeJSONResponse(w, http.StatusOK, response)
}

// Handler func to update a category
func (h *Handler) UpdateCategory(w http.ResponseWriter, r *http.Request) {
	// Extract the ID from the URL path
	vars := mux.Vars(r)
	catId := vars["categoryId"]

	log.Info().Str("category_id", catId).Msg("PUT /api/categories/{ID} - Updating category")

	var req struct {
		Name        string `json:"category_name"`
		Description string `json:"description"`
	}

	if err := json.NewDecoder(r.Body).Decode(&req); err != nil {
		log.Error().Err(err).Str("category_id", catId).Msg("Invalid JSON in update category request")
		writeErrorResponse(w, http.StatusBadRequest, "Invalid JSON: "+err.Error())
		return
	}

	log.Info().
		Str("category_id", catId).
		Str("Name", req.Name).
		Str("Description", req.Description).
		Msg("Updating category with new data")

	// Convert the ID to an int
	// id, err := strconv.Atoi(idStr)
	// if err != nil {
	// 	log.Warn().Str("id", idStr).Msg("Invalid category ID format")
	// 	writeErrorResponse(w, http.StatusInternalServerError, "Invalid category ID")
	// 	return
	// }

	// Update category in the db
	err := h.db.UpdateCategory(catId, req.Name, req.Description)
	if err != nil {
		if err.Error() == "category not found" {
			log.Warn().Str("cat_id", catId).Msg("Category not found for an update")
			writeErrorResponse(w, http.StatusInternalServerError, "Category not found")
			return
		}
		log.Error().Err(err).Str("cat_id", catId).Msg("Error updating the category")
		writeErrorResponse(w, http.StatusInternalServerError, "Failed to update the category")
		return
	}

	log.Info().Str("category_id", catId).Str("name", req.Name).Msg("Successfully updated the category")

	response := map[string]interface{}{
		"message": "Category was updated successfully",
	}

	writeJSONResponse(w, http.StatusOK, response)
}

// Handler func for deleting a category
func (h *Handler) DeleteCategory(w http.ResponseWriter, r *http.Request) {
	// Extract the ID from the URL path
	vars := mux.Vars(r)
	catId := vars["categoryId"]

	// Delete the category
	err := h.db.DeleteCategory(catId)
	if err != nil {
		if err.Error() == "category not found" {
			writeErrorResponse(w, http.StatusNotFound, "Category not found")
			return
		}
		log.Printf("Error deleting the category: %v", err)
		writeErrorResponse(w, http.StatusInternalServerError, "Failed to delete the category")
		return
	}

	response := map[string]interface{}{
		"message": "Category was successfully deleted",
	}

	writeJSONResponse(w, http.StatusOK, response)
}

// #endregion
