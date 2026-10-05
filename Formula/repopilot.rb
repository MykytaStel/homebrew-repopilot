# Template used by the release workflow to auto-update the Homebrew tap.
# 0.24.2, 11f2d279737c5624af5f3fe3b3fdc486b626d184c58419099075a3e91cbf5702, 570c9c997652fb8fd17e88dc83b56ce484de58005142ce6d8cc668cdbe9bfe76, abe1fa5c036586b8585164367f87a52d5bebbcccffe7c259615d4e6e18710650,
# bc4815aa9c02bf178646e5ba06be9f341f6d43b7732ff3b418655d62983b7814 are replaced by the update-homebrew-tap CI job.
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
  version "0.24.2"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "11f2d279737c5624af5f3fe3b3fdc486b626d184c58419099075a3e91cbf5702"
    end
    on_intel do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "570c9c997652fb8fd17e88dc83b56ce484de58005142ce6d8cc668cdbe9bfe76"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "abe1fa5c036586b8585164367f87a52d5bebbcccffe7c259615d4e6e18710650"
    end
    on_intel do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bc4815aa9c02bf178646e5ba06be9f341f6d43b7732ff3b418655d62983b7814"
    end
  end

  def install
    bin.install "repopilot"
  end

  test do
    system "#{bin}/repopilot", "--version"
  end
end
