package main

import (
	"errors"

	"github.com/hashicorp/hcl/v2/hclsimple"
)

// Config top level configuration options
type Config struct {
	Formulae []FormulaConfig `hcl:"formula,block"`
}

// FormulaConfig all the required data for the formulae.
type FormulaConfig struct {
	Product       string               `hcl:"product"`
	Name          string               `hcl:"name"`
	Desc          string               `hcl:"desc"`
	Homepage      string               `hcl:"homepage"`
	Architectures FormulaArchitectures `hcl:"architectures,block"`
	Version       string
}

// FormulaArchitectures architecture support
type FormulaArchitectures struct {
	Amd64   Architecture `hcl:"amd64,block"`
	Aarch64 Architecture `hcl:"aarch64,block"`
}

type Architecture struct {
	DarwinFormula FormulaMetadata `hcl:"darwin,block"`
	LinuxFormula  FormulaMetadata `hcl:"linux,block"`
}

type FormulaMetadata struct {
	Enable     bool   `hcl:"enable"`
	Binary     string `hcl:"binary,optional"`
	ReleaseURL string
	ShaSum     string
}

func loadConfig(filepath string) (Config, error) {
	var config Config

	err := hclsimple.DecodeFile(filepath, nil, &config)

	return config, err
}

func (c Config) getFormula(product string) (FormulaConfig, error) {
	for _, formula := range c.Formulae {
		if formula.Product == product {
			return formula, nil
		}
	}

	return FormulaConfig{}, errors.New("formula not found")
}
