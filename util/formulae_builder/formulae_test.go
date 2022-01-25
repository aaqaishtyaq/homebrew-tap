package main

import (
	"bytes"
	"testing"

	"github.com/stretchr/testify/assert"
	"github.com/stretchr/testify/require"
)

func TestPrintFormula(t *testing.T) {
	product := "iay"
	version := "0.1.5"
	config := "./config.hcl"
	buf := new(bytes.Buffer)
	expect := `class iay < Formula
  desc "Minimilist shell prompt."
  homepage "https://github.com/aaqaishtyaq/iay"
  version "0.1.5"

  if OS.mac?
    url "https://github.com/aaqaishtyaq/iay/releases/download/v0.1.5/iay-x86_64-apple-darwin.tar.gz"
    sha256 "c27972cbbab0cfcf4ca7ad776f4c4eadf8775bba346540c9a2265bbcd6910571"
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

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/aaqaishtyaq/iay/releases/download/v0.1.5/iay-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "1beb0f616ce47ed459d6c58ea134a1c4a3d5de566c4a2a5b74d9cab89038e199"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/aaqaishtyaq/iay/releases/download/v0.1.5/iay-aarch64-unknown-linux-musl.tar.gz"
    sha256 "4e151f5eb85c0c98ddc64974b770ef9e984c0aed783a69c630db1e705b573c87"
  end

  conflicts_with "iay"

  def install
    bin.install "iay"
  end

  test do
    system "#{bin}/iay --version"
  end
end
`

	err := printFormula(product, version, config, buf)
	require.Nil(t, err)
	assert.Equal(t, expect, buf.String())
}
