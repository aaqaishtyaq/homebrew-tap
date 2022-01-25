package main

import (
	"fmt"
	"io"
	"net/http"
	"strings"
)

func loadMeta(config *FormulaConfig) error {
	if config.Architectures.Amd64.DarwinFormula.Enable {
		releaseURL, shaSum, err := fetchMeta(config, config.Architectures.Amd64.DarwinFormula.Binary)
		if err != nil {
			return err
		}

		config.Architectures.Amd64.DarwinFormula.ReleaseURL = releaseURL
		config.Architectures.Amd64.DarwinFormula.ShaSum = shaSum
	}

	if config.Architectures.Amd64.LinuxFormula.Enable {
		releaseURL, shaSum, err := fetchMeta(config, config.Architectures.Amd64.LinuxFormula.Binary)
		if err != nil {
			return err
		}

		config.Architectures.Amd64.LinuxFormula.ReleaseURL = releaseURL
		config.Architectures.Amd64.LinuxFormula.ShaSum = shaSum
	}

	if config.Architectures.Aarch64.DarwinFormula.Enable {
		releaseURL, shaSum, err := fetchMeta(config, config.Architectures.Aarch64.DarwinFormula.Binary)
		if err != nil {
			return err
		}

		config.Architectures.Aarch64.DarwinFormula.ReleaseURL = releaseURL
		config.Architectures.Aarch64.DarwinFormula.ShaSum = shaSum
	}

	if config.Architectures.Aarch64.LinuxFormula.Enable {
		releaseURL, shaSum, err := fetchMeta(config, config.Architectures.Aarch64.LinuxFormula.Binary)
		if err != nil {
			return err
		}

		config.Architectures.Aarch64.LinuxFormula.ReleaseURL = releaseURL
		config.Architectures.Aarch64.LinuxFormula.ShaSum = shaSum
	}

	return nil
}

func fetchMeta(config *FormulaConfig, binary string) (string, string, error) {
	releaseURL := fmt.Sprintf("https://github.com/aaqaishtyaq/%s/releases/download/v%s/%s-%s.tar.gz", config.Product, config.Version, config.Product, binary)
	shaSumURL := fmt.Sprintf("%s.sha256", releaseURL)
	s, err := loadShasum(shaSumURL)
	shaSum := strings.Trim(s, "\n")
	if err != nil {
		return "", "", err
	}
	return releaseURL, shaSum, nil
}

func loadShasum(url string) (string, error) {
	resp, err := http.Get(url)
	if err != nil {
		return "", err
	}

	defer resp.Body.Close()

	if resp.StatusCode != http.StatusOK {
		return "", fmt.Errorf("StatusCode: %d", resp.StatusCode)
	}

	body, err := io.ReadAll(resp.Body)
	if err != nil {
		return "", err
	}

	return string(body), nil
}
