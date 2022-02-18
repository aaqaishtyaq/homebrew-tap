class Iay < Formula
  desc "Minimilist shell prompt."
  homepage "https://github.com/aaqaishtyaq/iay"
  version "0.1.7"

  if OS.mac?
    url "https://github.com/aaqaishtyaq/iay/releases/download/v0.1.7/iay-x86_64-apple-darwin.tar.gz"
    sha256 "7fa50856957c9014ec6956f1678793520cdbc6aaf62bdbfb131eca978a5aabf7"
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
    url "https://github.com/aaqaishtyaq/iay/releases/download/v0.1.7/iay-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b0f7b243951d91382f7f79ec45de6e0f1d43828d04d0615997242df0c3853024"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/aaqaishtyaq/iay/releases/download/v0.1.7/iay-aarch64-unknown-linux-musl.tar.gz"
    sha256 "723f786425cfdf8a1b843732c2a849b1f0a91eec247b6d3942bd681107993ad0"
  end

  conflicts_with "iay"

  def install
    bin.install "iay"
  end

  test do
    system "#{bin}/iay --version"
  end
end
