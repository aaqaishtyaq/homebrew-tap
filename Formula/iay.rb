class Iay < Formula
  desc "Minimilist shell prompt."
  homepage "https://github.com/aaqaishtyaq/iay"
  version "0.1.8"

  if OS.mac?
    url "https://github.com/aaqaishtyaq/iay/releases/download/v0.1.8/iay-x86_64-apple-darwin.tar.gz"
    sha256 "f48aee7225fd27a60c344d5e6fd531c56edd115b7c3d8c1f70532a56559602c0"
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
    url "https://github.com/aaqaishtyaq/iay/releases/download/v0.1.8/iay-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "491235db9665b86662be36cf95e42ffee4ec746f4ddc89bfff0fadc35af20e9a"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/aaqaishtyaq/iay/releases/download/v0.1.8/iay-aarch64-unknown-linux-musl.tar.gz"
    sha256 "3b4466e68b985b4b78f441dc507c86bd8f3480ed612e7b7f6e4c90b9844066af"
  end

  conflicts_with "iay"

  def install
    bin.install "iay"
  end

  test do
    system "#{bin}/iay --version"
  end
end
