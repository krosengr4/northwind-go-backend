package repository

import (
	"database/sql"
)

type DB struct {
	*sql.DB
}

// Create new database connection
// func New(cfg *appconfig.Config) (*DB, error) {
// 	// Get the database URL
// 	databaseURL, err := cfg.
// }
