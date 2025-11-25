package appconfig

import (
	"fmt"
	"path/filepath"

	"github.com/caarlos0/env"
	"github.com/joho/godotenv"
	"github.com/rs/zerolog/log"
)

type Config struct {
	// Database Configuration
	PostgresHost         string `env:"POSTGRES_HOST"`
	PostgresPort         string `env:"POSTGRES_PORT"`
	PostgresDB           string `env:"POSTGRES_DB"`
	PostgresUser         string `env:"POSTGRES_USER"`
	PostgresPasswordFile string `env:"POSTGRES_PASSWORD_FILE"`
	// PostgresPassword string `env:"POSTGRES_PASSWORD_FILE"`
	PostgresSSLMode string `env:"POSTGRES_SSL_MODE"`

	// Logging Configuration
	LogLevel  string `env:"LOG_LEVEL"`
	LogFormat string `env:"LOG_FORMAT"`

	// Secrets Configuration
	SecretsPath string `env:"SECRETS_PATH"`
}

// Load loads the configuration from envrionment variables and .env files
func Load() (*Config, error) {
	// Load .env file if one exists
	if err := godotenv.Load(); err != nil {
		log.Warn().Err(err).Msg("No .env file found or failed to load")
	}

	cfg := &Config{}

	// Parse env variables using caarlos0/env
	if err := env.Parse(cfg); err != nil {
		return nil, fmt.Errorf("failed to parse the environment variables: %w", err)
	}

	// Validate required configurations
	if err := cfg.Validate(); err != nil {
		return nil, err
	}

	log.Info().
		Str("port:", cfg.PostgresPort).
		Str("database: ", cfg.PostgresDB).
		Str("log level: ", cfg.LogLevel).
		Msg("Configuration loaded succesfully")

	return cfg, nil
}

// Validate will validate the configuration
func (c *Config) Validate() error {
	// Check each individual database component
	if c.PostgresHost == "" {
		return fmt.Errorf("POSTGRES_HOST is required")
	}
	if c.PostgresPort == "" {
		return fmt.Errorf("POSTGRES_PORT is required")
	}
	if c.PostgresDB == "" {
		return fmt.Errorf("POSTGRES_DB is required")
	}
	if c.PostgresUser == "" {
		return fmt.Errorf("POSTGRES_USER is required")
	}
	if c.PostgresPasswordFile == "" {
		return fmt.Errorf("POSTGRES_PASSWORD_FILE is required")
	}

	// Check that SECRETS_PATH is set
	if !filepath.IsAbs(c.PostgresPasswordFile) && c.SecretsPath == "" {
		return fmt.Errorf("SECRETS_PATH is required when using relative paths for POSTGRES_PASSWORD_FILE")
	}

	return nil
}
