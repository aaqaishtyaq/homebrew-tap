class Iay < Formula
  desc "Minimilist shell prompt."
  homepage "https://github.com/aaqaishtyaq/iay"
  version "0.4.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/aaqaishtyaq/iay/releases/download/v0.4.2/iay-x86_64-apple-darwin.tar.gz"
    sha256 "49d69bbb20813cd12a1e62aec6c636d653abbb9eb39e562db52965eb342ca3ba"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/aaqaishtyaq/iay/releases/download/v0.4.2/iay-aarch64-apple-darwin.tar.gz"
    sha256 "4b653385b9ba2dd730f5f4c5b4b627dd3cc3fdb35482ab5df12c753bc5bf9b8a"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/aaqaishtyaq/iay/releases/download/v0.4.2/iay-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "997e77e2414d94316eca54ca74e581507deeb2c79e2f6c3cffbf0c8f0f8f787f"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/aaqaishtyaq/iay/releases/download/v0.4.2/iay-aarch64-unknown-linux-musl.tar.gz"
    sha256 "01f23fc91f5532230f399f1bb2c70d60196a235c20a6c5edb7abd2e18fde665c"
  end

  conflicts_with "iay"

  def install
    bin.install "iay"
  end

  test do
    system "#{bin}/iay --version"
  end
end
