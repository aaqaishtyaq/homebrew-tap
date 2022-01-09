package main

import (
	"fmt"
	"os"
)

// Usage: formula_builder <product> <version> <configPath>
// Example: formula_builder iay 0.1.6 ./config.hcl
func main() {
	if len(os.Args) < 3 {
		fmt.Println("Please provide product and version")
		os.Exit(1)
	}
	product := os.Args[1]
	version := os.Args[2]
	// config := os.Args[3]

	// err := printFormula(product, version, config, os.Stdout)
	// if err != nil {
	// 	fmt.Println(err)
	// }

	sums, err := loadShasums(product, version)
	if err != nil {
		fmt.Println(err)
		os.Exit(1)
	}

	fmt.Println(sums)

	os.Exit(0)
}
