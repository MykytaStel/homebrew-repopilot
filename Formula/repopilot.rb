# Template used by the release workflow to auto-update the Homebrew tap.
# 0.19.0, a2024a407a1c97e948882e32692e7969d5dab060f7387f369c702b58d0ba3d8f, a4dc21dba6edac912647aca73033bff7291e499e09bef8eaefb3e42016a70e45, 9c9335bd760c2cf809d89358b1869dd6793666e5fa42c1b2ada97c9718c382fa,
# bf68b14f1f8b81c5571587b01ebb427f3a4e6cf8b883afa8db69f5e3db8b3ebf are replaced by the update-homebrew-tap CI job.
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
  desc "Local-first CLI for reviewing Git changes before merge"
  homepage "https://github.com/MykytaStel/repopilot"
  version "0.19.0"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "a2024a407a1c97e948882e32692e7969d5dab060f7387f369c702b58d0ba3d8f"
    end
    on_intel do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "a4dc21dba6edac912647aca73033bff7291e499e09bef8eaefb3e42016a70e45"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9c9335bd760c2cf809d89358b1869dd6793666e5fa42c1b2ada97c9718c382fa"
    end
    on_intel do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bf68b14f1f8b81c5571587b01ebb427f3a4e6cf8b883afa8db69f5e3db8b3ebf"
    end
  end

  def install
    bin.install "repopilot"
  end

  test do
    system "#{bin}/repopilot", "--version"
  end
end
