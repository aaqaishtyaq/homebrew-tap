class Iay < Formula
  desc "Minimilist shell prompt."
  homepage "https://github.com/aaqaishtyaq/iay"
  version "0.4.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/aaqaishtyaq/iay/releases/download/v0.4.3/iay-x86_64-apple-darwin.tar.gz"
    sha256 "6e34baef53187be97f7921cbef4bd6b5b2ac8a966f682e9de2cede4e45e414dd"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/aaqaishtyaq/iay/releases/download/v0.4.3/iay-aarch64-apple-darwin.tar.gz"
    sha256 "72068b6a8730feb2c3233c6c7115153d92b4523d9930839f83cb05f74ed2d1cc"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/aaqaishtyaq/iay/releases/download/v0.4.3/iay-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "3a126a3ec19a80dd890273439c6f765bcfc63d960e21c5a582b0ac366bfac2f0"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/aaqaishtyaq/iay/releases/download/v0.4.3/iay-aarch64-unknown-linux-musl.tar.gz"
    sha256 "3d0076b9a65e7644f18dc79166adc92350c867fbbd2687969a34e4edfd2db60b"
  end

  conflicts_with "iay"

  def install
    bin.install "iay"
  end

  test do
    system "#{bin}/iay --version"
  end
end
