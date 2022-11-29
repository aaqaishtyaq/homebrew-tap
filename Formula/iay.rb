class Iay < Formula
  desc "Minimilist shell prompt."
  homepage "https://github.com/aaqaishtyaq/iay"
  version "0.4.0"

  if OS.mac?
    url "https://github.com/aaqaishtyaq/iay/releases/download/v0.4.0/iay-x86_64-apple-darwin.tar.gz"
    sha256 "54389247b6a864a6ea2547ca4a06051c68713fd0b490ecde87b8ac1ad7f6a070"
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
    url "https://github.com/aaqaishtyaq/iay/releases/download/v0.4.0/iay-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "43f6650aff830ae8b12ae4d38c0efbd1092b53aee2a3a6878f2bcc51d1e89769"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/aaqaishtyaq/iay/releases/download/v0.4.0/iay-aarch64-unknown-linux-musl.tar.gz"
    sha256 "8a7e08235a2cd7be3c19c974209a9f8c7529c85b1499e6f8c04bd924325bded7"
  end

  conflicts_with "iay"

  def install
    bin.install "iay"
  end

  test do
    system "#{bin}/iay --version"
  end
end
