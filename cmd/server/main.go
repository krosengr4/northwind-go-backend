package main

import (
	"net/http"
	appconfig "northwind-api/internal/config"
	"northwind-api/internal/handler"
	"northwind-api/internal/middleware"
	database "northwind-api/internal/repository"
	"os"
	"time"

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

	// Load configurations
	cfg, err := appconfig.Load()
	if err != nil {
		log.Fatal().Err(err).Msg("Failed to laod configuration")
	}

	// Initialize database
	db, err := database.New(cfg)
	if err != nil {
		log.Fatal().Err(err).Msg("Failed to initialize the database")
	}
	defer db.Close()

	// Start cleanup job in the background
	// ctx := context.Background()

	// Initialize handlers
	handler := handler.New(db, cfg)

	// Set up router with middlewear
	router := setupRouter(handler)

	// Initialize CORS middlewear with configuration
	corsConfig := middleware.CORSConfig{
		AllowedOrigins: cfg.GetAllowedOrigins(),
	}

	// Apply middlewear chain: Recover -> Logging -> CORS -> Router
	httpHandler := middleware.Recovery(
		middleware.Logging(
			middleware.CORS(corsConfig)(router),
		),
	)

	// Start server
	log.Info().Str("port", cfg.ServerPort).Msg("Northwind Service starting")

	server := &http.Server{
		Addr:         ":" + cfg.ServerPort,
		Handler:      httpHandler,
		ReadTimeout:  15 * time.Second,
		WriteTimeout: 15 * time.Second,
		IdleTimeout:  60 * time.Second,
	}

	log.Fatal().Err(server.ListenAndServe()).Msg("Server failed to start")

}

// Setup router configures all of the API routes
func setupRouter(h *handler.Handler) *mux.Router {
	router := mux.NewRouter()

	// API routes
	api := router.PathPrefix("/api").Subrouter()

	// Categories
	api.HandleFunc("/categories", h.GetCategories).Methods("GET")
	api.HandleFunc("/categories/{categoryId}", h.GetCategoryById).Methods("GET")
	api.HandleFunc("/categories", h.CreateCategory).Methods("POST")
	api.HandleFunc("/categories/{categoryId}", h.UpdateCategory).Methods("PUT")
	api.HandleFunc("/categories/{categoryId}", h.DeleteCategory).Methods("DELETE")

	return router
}
