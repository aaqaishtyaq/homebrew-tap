class Iay < Formula
  desc "Minimilist shell prompt."
  homepage "https://github.com/aaqaishtyaq/iay"
  version "0.5.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/aaqaishtyaq/iay/releases/download/v0.5.0/iay-x86_64-apple-darwin.tar.gz"
    sha256 "a586432a5510ee2084b832f60a1b555e478147a53ee3300d2d3b2f1825c3f527"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/aaqaishtyaq/iay/releases/download/v0.5.0/iay-aarch64-apple-darwin.tar.gz"
    sha256 "8ea4ddc6dd5f3bec5d6f85075574936a718c1cea90278f001f2b15624571f79a"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/aaqaishtyaq/iay/releases/download/v0.5.0/iay-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ca5a9f3dcd531b0145fe7fd649d3d3eacf67b4a7a2ada6d3e680d5c97a17f474"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/aaqaishtyaq/iay/releases/download/v0.5.0/iay-aarch64-unknown-linux-musl.tar.gz"
    sha256 "369248eac94f0b32e61999a6a9d3b6b419637b3aec06301af42aeed9199c9844"
  end

  conflicts_with "iay"

  def install
    bin.install "iay"
  end

  test do
    system "#{bin}/iay --version"
  end
end
