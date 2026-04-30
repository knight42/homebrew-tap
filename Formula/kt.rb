class Kt < Formula
  homepage "https://github.com/knight42/kt"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/knight42/kt/releases/download/v#{version}/kt_#{version}_darwin_arm64.tar.gz"
      sha256 "e8ed69e34dbb9f4d25fc39b6b8ad1889d3bbdd4c221e7036bfb96508d02ca770"
    else
      url "https://github.com/knight42/kt/releases/download/v#{version}/kt_#{version}_darwin_amd64.tar.gz"
      sha256 "5502debb70783a9e16666547e90b01461e7de75941ae4c59d9bdf6184a308be8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/knight42/kt/releases/download/v#{version}/kt_#{version}_linux_arm64.tar.gz"
      sha256 "232e2d650592d574cbd4715124f6092f4ca62339f4e7ad69be44a4d03aa03f83"
    else
      url "https://github.com/knight42/kt/releases/download/v#{version}/kt_#{version}_linux_amd64.tar.gz"
      sha256 "692681ac1ea314f05faefc23ad953a80b3557ffa2f12f85d14ad1e300e8f72c2"
    end
  end

  def install
    bin.install "kt"

    output = Utils.popen_read("#{bin}/kt --completion bash")
    (bash_completion/"kt").write output

    output = Utils.popen_read("#{bin}/kt --completion zsh")
    (zsh_completion/"_kt").write output
  end

  test do
    system "#{bin}/kt", "--version"
  end
end
