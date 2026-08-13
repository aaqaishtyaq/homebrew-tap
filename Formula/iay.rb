class Iay < Formula
  desc "Minimilist shell prompt."
  homepage "https://github.com/aaqaishtyaq/iay"
  version "0.5.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/aaqaishtyaq/iay/releases/download/v0.5.1/iay-x86_64-apple-darwin.tar.gz"
    sha256 "71ab3976b1d5f514dbd16fd8467f0fbb22b7f959fd20ab37deffaa7dbdbcdde3"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/aaqaishtyaq/iay/releases/download/v0.5.1/iay-aarch64-apple-darwin.tar.gz"
    sha256 "1aab0682e6bced1e33e34e861b3e4dfb5def8d365090c7454afe6df487f4b64b"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/aaqaishtyaq/iay/releases/download/v0.5.1/iay-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "bd99cd038c40c2dcb85c9fe69cf76d24eae6f80fedcae57b232c186351aa5ebe"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/aaqaishtyaq/iay/releases/download/v0.5.1/iay-aarch64-unknown-linux-musl.tar.gz"
    sha256 "b91c4ff0db4a05e49750a36845156986e26f48220a5780a5b99604ffedf9ca5d"
  end

  conflicts_with "iay"

  def install
    bin.install "iay"
  end

  test do
    system "#{bin}/iay --version"
  end
end
