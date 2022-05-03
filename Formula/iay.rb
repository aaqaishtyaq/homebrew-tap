class Iay < Formula
  desc "Minimilist shell prompt."
  homepage "https://github.com/aaqaishtyaq/iay"
  version "0.2.0"

  if OS.mac?
    url "https://github.com/aaqaishtyaq/iay/releases/download/v0.2.0/iay-x86_64-apple-darwin.tar.gz"
    sha256 "40805149ddf7234615e3140bd083256bd685a67d29823427f0aece7c5bfc7420"
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
    url "https://github.com/aaqaishtyaq/iay/releases/download/v0.2.0/iay-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "043bf46ba4e62d67c148cc6e7973a204ecf78b3c7ea810c0ae4517d7f7a0e179"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/aaqaishtyaq/iay/releases/download/v0.2.0/iay-aarch64-unknown-linux-musl.tar.gz"
    sha256 "53b1ba44557f161999b0716e76db56620b5de8a38f52fe18c68cbe0f6a9c8272"
  end

  conflicts_with "iay"

  def install
    bin.install "iay"
  end

  test do
    system "#{bin}/iay --version"
  end
end
