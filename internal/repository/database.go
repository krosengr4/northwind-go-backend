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
		return "", fmt.Errorf("failed to create application: %w", err)
	}

	category, err := db.GetCategoryByName(name)
	if err != nil {
		return nil, fmt.Errorf("Failure to get category after created: %w", err)
	}

	return category.CategoryId, nil
}

// #endregion
