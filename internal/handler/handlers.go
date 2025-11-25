package handler

import (
	appconfig "northwind-api/internal/config"
	"northwind-api/internal/repository"
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

type ErrorResponse struct {
	Error string `json:"error"`
}
