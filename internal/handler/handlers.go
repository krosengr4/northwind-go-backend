package handler

import (
	"encoding/json"
	"net/http"
	appconfig "northwind-api/internal/config"
	"northwind-api/internal/repository"

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

// Handler to get category by its ID
func (h *Handler) GetCategoryById(w http.ResponseWriter, r *http.Request) {
	log.Info().Msg("GET /api/categories/{ID} - Getting category by ID")

	// Extract the ID from the URL path
	vars := mux.Vars(r)
	idStr := vars["id"]

	category, err := h.db.GetCategoryById(idStr)
	if err != nil {
		if err.Error() == "category not found" {
			log.Warn().Str("ID", idStr).Msg("Category not found")
			writeErrorResponse(w, http.StatusInternalServerError, "Category not found")
			return
		}
		log.Error().Err(err).Msg("Error getting categories")
		writeErrorResponse(w, http.StatusInternalServerError, "Failed to get that category")
		return
	}

	log.Info().Str("ID", idStr).Msg("Successfully retrieved the category")
	writeJSONResponse(w, http.StatusOK, category)
}
