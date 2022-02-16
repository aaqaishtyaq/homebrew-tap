class Iay < Formula
  desc "Minimilist shell prompt."
  homepage "https://github.com/aaqaishtyaq/iay"
  version "0.1.6"

  if OS.mac?
    url "https://github.com/aaqaishtyaq/iay/releases/download/v0.1.6/iay-x86_64-apple-darwin.tar.gz"
    sha256 "b358b593ea5ab2e78956ddcf91f8bf27e4024c042dbf2f2fcfffdbe7d641c588"
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
    url "https://github.com/aaqaishtyaq/iay/releases/download/v0.1.6/iay-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e3443e1befc4d0133ef535fee2a72ccd46f734da55f663086c1e0580b9cfc47b"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/aaqaishtyaq/iay/releases/download/v0.1.6/iay-aarch64-unknown-linux-musl.tar.gz"
    sha256 "fa9b72be9dc4bb05e2c0521028793630dac93a5ee7f62b7d310ba1f4eef92a49"
  end

  conflicts_with "iay"

  def install
    bin.install "iay"
  end

  test do
    system "#{bin}/iay --version"
  end
end
