# Template used by the release workflow to auto-update the Homebrew tap.
# 0.9.0, 1b41dbfc85de1d4dd318f039a98d6ac39e3af4f1ba5e6b8c01b9014b6aaa6201, cd7759dd8d4566adef6997c041256300ca14a76c68038aa888991afca967bb44, f335d41765c4355a1034b34e4c8b918ca636fe9c4d460c4c82bab6c130ebc4df,
# e0cfaf5e9cc02cf507dff2419b3bac0590039d1f0daa5efb4806fb33ee8fafdb are replaced by the update-homebrew-tap CI job.
#
# Manual setup (one-time):
#   1. Create repo MykytaStel/homebrew-repopilot with a Formula/ directory.
#   2. Add HOMEBREW_TAP_TOKEN (PAT with repo write scope) to the main repo secrets.
#   After that, every v* tag triggers an automatic formula update.
#
# Manual install:
#   brew tap mykytastel/repopilot
#   brew install repopilot

class Repopilot < Formula
  desc "Local-first CLI for repository audit and architecture risk detection"
  homepage "https://github.com/MykytaStel/repopilot"
  version "0.9.0"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "1b41dbfc85de1d4dd318f039a98d6ac39e3af4f1ba5e6b8c01b9014b6aaa6201"
    end
    on_intel do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "cd7759dd8d4566adef6997c041256300ca14a76c68038aa888991afca967bb44"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f335d41765c4355a1034b34e4c8b918ca636fe9c4d460c4c82bab6c130ebc4df"
    end
    on_intel do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e0cfaf5e9cc02cf507dff2419b3bac0590039d1f0daa5efb4806fb33ee8fafdb"
    end
  end

  def install
    bin.install "repopilot"
  end

  test do
    system "#{bin}/repopilot", "--version"
  end
end
