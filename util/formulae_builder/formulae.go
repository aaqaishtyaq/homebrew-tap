package main

import (
	"io"
	"text/template"
)

func printFormula(product string, version string, configLocation string, out io.Writer) error {
	config, err := loadConfig(configLocation)
	if err != nil {
		return err
	}

	productConfig, err := config.getFormula(product)
	if err != nil {
		return err
	}

	productConfig.Version = version
	err = loadMeta(&productConfig)
	if err != nil {
		return err
	}

	t := template.Must(template.New("formula").Parse(formulaTemplate))

	return t.Execute(out, productConfig)
}

const formulaTemplate = `class {{ .Name }} < Formula
  desc "{{ .Desc }}"
  homepage "{{ .Homepage }}"
  version "{{ .Version }}"
  {{- if and .Architectures.Aarch64.DarwinFormula.Enable .Architectures.Amd64.DarwinFormula.Enable }}

  if OS.mac? && Hardware::CPU.intel?
    url "{{ .Architectures.Amd64.DarwinFormula.ReleaseURL }}"
    sha256 "{{ .Architectures.Amd64.DarwinFormula.ShaSum }}"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "{{ .Architectures.Aarch64.DarwinFormula.ReleaseURL }}"
    sha256 "{{ .Architectures.Aarch64.DarwinFormula.ShaSum }}"
  end

  {{- else }}

  if OS.mac?
    url "{{ .Architectures.Amd64.DarwinFormula.ReleaseURL }}"
    sha256 "{{ .Architectures.Amd64.DarwinFormula.ShaSum }}"
  end

  if OS.mac? && Hardware::CPU.arm?
    def caveats
      <<~EOS
        The darwin_arm64 architecture is not supported for this product
        at this time, however we do plan to support this in the future. The
        darwin_amd64 binary has been installed and may work in
        compatibility mode, but it is not fully supported.
      EOS
    end
  end

  {{- end }}
  {{- if .Architectures.Amd64.LinuxFormula.Enable }}

  if OS.linux? && Hardware::CPU.intel?
    url "{{ .Architectures.Amd64.LinuxFormula.ReleaseURL }}"
    sha256 "{{ .Architectures.Amd64.LinuxFormula.ShaSum }}"
  end

  {{- end }}
  {{- if .Architectures.Aarch64.LinuxFormula.Enable }}

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "{{ .Architectures.Aarch64.LinuxFormula.ReleaseURL }}"
    sha256 "{{ .Architectures.Aarch64.LinuxFormula.ShaSum }}"
  end

  {{- end }}

  conflicts_with "{{ .Product }}"

  def install
    bin.install "{{ .Product }}"
  end

  test do
    system "#{bin}/{{ .Product }} --version"
  end
end
`
