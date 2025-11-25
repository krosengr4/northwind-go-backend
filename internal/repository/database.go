package repository

import (
	"database/sql"
	"fmt"
	appconfig "northwind-api/internal/config"
	"northwind-api/internal/model"

	_ "github.com/lib/pq"
	"github.com/rs/zerolog/log"
)

type DB struct {
	*sql.DB
}

// Create new database connection
func New(cfg *appconfig.Config) (*DB, error) {
	// Get the database URL
	databaseURL, err := cfg.GetDatabaseURL()
	if err != nil {
		return nil, fmt.Errorf("could not get the database url: %w", err)
	}

	db, err := sql.Open("postgres", databaseURL)
	if err != nil {
		return nil, fmt.Errorf("failed to connect to database: %w", err)
	}

	if err = db.Ping(); err != nil {
		return nil, fmt.Errorf("failed to ping database: %w", err)
	}

	log.Info().Msg("Database successfully connected!")
	return &DB{DB: db}, nil
}

// #region categories

// GET /api/categories
func (db *DB) GetAllCategories() ([]model.Category, error) {
	query := "SELECT * FROM categories"
	rows, err := db.Query(query)
	if err != nil {
		return nil, fmt.Errorf("failed to query categories: %w", err)
	}
	defer rows.Close()

	var categories []model.Category
	for rows.Next() {
		var cat model.Category
		err := rows.Scan(&cat.CategoryId, &cat.Name, &cat.Description)
		if err != nil {
			return nil, fmt.Errorf("failed to scan categories: %w", err)
		}

		categories = append(categories, cat)
	}

	return categories, nil
}

// GET /api/categories/{categoryID}
func (db *DB) GetCategoryById(id int) (*model.Category, error) {
	query := "SELECT * FROM categories WHERE category_id = $1"

	var cat model.Category
	err := db.QueryRow(query, id).Scan(&cat.CategoryId, &cat.Name, &cat.Description)
	if err == sql.ErrNoRows {
		return nil, fmt.Errorf("category not found")
	}
	if err != nil {
		return nil, fmt.Errorf("failed to query category: %w", err)
	}

	return &cat, nil
}

// GET /api/categories/name
func (db *DB) GetCategoryByName(name string) (*model.Category, error) {
	query := "SELECT * FROM categories WHERE category_name = $1"

	var cat model.Category
	err := db.QueryRow(query, name).Scan(&cat.CategoryId, &cat.Name, &cat.Description)
	if err == sql.ErrNoRows {
		return nil, fmt.Errorf("category not found")
	}
	if err != nil {
		return nil, fmt.Errorf("failed to query category: %w", err)
	}

	return &cat, nil
}

// POST /api/categories
func (db *DB) CreateNewCategory(name, description string) (int, error) {
	query := `
		INSERT INTO categories (category_id, category_name, description)
		VALUES (DEFAULT, $1, $2)
	`

	_, err := db.Exec(query, name, description)
	if err != nil {
		return 0, fmt.Errorf("failed to create category: %w", err)
	}

	category, err := db.GetCategoryByName(name)
	if err != nil {
		return 0, fmt.Errorf("failure to get category after created: %w", err)
	}

	return category.CategoryId, nil
}

// PUT /api/categories/{cat_id}
func (db *DB) UpdateCategory(id, name, description string) error {
	log.Info().
		Str("id", id).
		Str("name", name).
		Str("description", description).
		Msg("Updating category in database")

	query := `
		UPDATE categories
		SET category_name = $2, description = $3
		WHERE category_id = $1
	`

	result, err := db.Exec(query, id, name, description)
	if err != nil {
		log.Error().Err(err).Str("category_id", id).Msg("Failed to execute update query")
		return fmt.Errorf("failed to get rows affected: %w", err)
	}

	rowsAffected, err := result.RowsAffected()
	if err != nil {
		log.Error().Err(err).Str("category_id", id).Msg("Failed to get rows affected")
		return fmt.Errorf("failed to get rows affected: %w", err)
	}

	log.Info().Str("category_id", id).Int64("rows_affected", rowsAffected).Msg("Update query was executed")

	if rowsAffected == 0 {
		log.Warn().Str("category_id", id).Msg("No rows affected - category not found")
		return fmt.Errorf("category not found")
	}

	log.Info().Str("category_id", id).Msg("Successfully updated the category in database")
	return nil
}

// todo: DELETE /api/categories/{categoryId}
// This will not delete the products under the category, but will set their category to null
func (db *DB) DeleteCategory(id string) error {
	// Use a transaction for atomicity and proper error handling
	tx, err := db.Begin()
	if err != nil {
		return fmt.Errorf("failed to begin transaction: %w", err)
	}
	defer tx.Rollback()

	// Check if category exists first
	var exists bool
	err = tx.QueryRow("SELECT EXISTS(SELECT 1 FROM categories WHERE category_id = $1)", id).Scan(&exists)
	if err != nil {
		return fmt.Errorf("failed to check the categories existence: %w", err)
	}
	if !exists {
		return fmt.Errorf("category not found")
	}

	// Delete the category
	result, err := tx.Exec("DELETE FROM categories WHERE category_id = $1", id)
	if err != nil {
		return fmt.Errorf("failed to delete the category: %w", err)
	}

	// Verify the deletion actually happened
	rowsAffected, err := result.RowsAffected()
	if err != nil {
		return fmt.Errorf("failed to get rows affected: %w", err)
	}
	if rowsAffected == 0 {
		return fmt.Errorf("category not found")
	}

	// Commit the transaction
	if err = tx.Commit(); err != nil {
		return fmt.Errorf("failed to commit transaction: %w", err)
	}

	log.Info().Str("category_id", id).Msg("Successfully deleted category")
	return nil
}

// #endregion
