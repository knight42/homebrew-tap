class Krelay < Formula
  homepage "https://github.com/knight42/krelay"
  version "0.1.2"
  head "https://github.com/knight42/krelay.git"
  on_macos do
    on_arm do
      url "https://github.com/knight42/krelay/releases/download/v#{version}/kubectl-relay_v#{version}_darwin-arm64.tar.gz"
      sha256 "2fb789f32aa1bfb325c90684a0e102de7cd3c7d0205b04935da383369c99698c"
    end
    on_intel do
      url "https://github.com/knight42/krelay/releases/download/v#{version}/kubectl-relay_v#{version}_darwin-amd64.tar.gz"
      sha256 "c8e6edd6c358b328b9b68e03bf80c6daf7ded306eba4b49d4aec2200b68c96ed"
    end
  end

  def install
    bin.install "kubectl-relay"
    bin.install_symlink "kubectl-relay" => "krelay"
  end

  test do
    system "#{bin}/kubectl-relay", "-V"
    system "#{bin}/krelay", "-V"
  end
end
