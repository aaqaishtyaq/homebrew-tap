class Iay < Formula
  desc "Minimilist shell prompt."
  homepage "https://github.com/aaqaishtyaq/iay"
  version "0.3.0"

  if OS.mac?
    url "https://github.com/aaqaishtyaq/iay/releases/download/v0.3.0/iay-x86_64-apple-darwin.tar.gz"
    sha256 "2a8bb648c20954943df424de81dd0de00ffc1ad4d13dc4638b91f56e3ba7f697"
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
    url "https://github.com/aaqaishtyaq/iay/releases/download/v0.3.0/iay-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "8105306ebe5946d01b32aa379ad5a1dcf1f47c2dab68842eafbbf724251fd912"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/aaqaishtyaq/iay/releases/download/v0.3.0/iay-aarch64-unknown-linux-musl.tar.gz"
    sha256 "a4692df4861fe9ee31a00e7f80518c7ffe46f7173be8242e18c6ba6678c7d1bd"
  end

  conflicts_with "iay"

  def install
    bin.install "iay"
  end

  test do
    system "#{bin}/iay --version"
  end
end
