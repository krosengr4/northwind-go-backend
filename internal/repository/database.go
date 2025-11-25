package repository

import (
	"database/sql"
	"fmt"
	appconfig "northwind-api/internal/config"
	"northwind-api/internal/model"

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
