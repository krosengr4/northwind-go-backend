package main

import (
	"northwind-api/internal/handler"
	"os"

	"github.com/gorilla/mux"
	"github.com/rs/zerolog"
	"github.com/rs/zerolog/log"
)

/*
	"github.com/gorilla/mux"
	"github.com/rs/zerolog"
	"github.com/rs/zerolog/log"
*/

func main() {
	// Setup zerolog
	zerolog.TimeFieldFormat = zerolog.TimeFormatUnix
	log.Logger = log.Output(zerolog.ConsoleWriter{Out: os.Stderr})

	log.Info().Msg("Starting Northwind Backend Service")

}

// Setup router configures all of the API routes
func setupRouter(h *handler.Handler) *mux.Router {
	router := mux.NewRouter()

	// API routes
	api := router.PathPrefix("/api").Subrouter()

	api.HandleFunc("/categories", h.GetCategories).Methods("GET")

	return router
}
