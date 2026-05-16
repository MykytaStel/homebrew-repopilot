# Template used by the release workflow to auto-update the Homebrew tap.
# 0.10.0, d7703625a28a0851b548104217470260fcc1ee0e0526f432c7a939e7d2c9e523, 965a3804d0145c6957415aa507d4195907236490847e3f2499eb32dc2435ab65, 850e4a5bdfde87379958ea8d43524e0a9fa917fd29445802758fa7954f30fa8f,
# b30c5abdd9c01892b26c8cd23ace7741ba6d1fceee2c260395b6eacf5b8a93e4 are replaced by the update-homebrew-tap CI job.
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
  version "0.10.0"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "d7703625a28a0851b548104217470260fcc1ee0e0526f432c7a939e7d2c9e523"
    end
    on_intel do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "965a3804d0145c6957415aa507d4195907236490847e3f2499eb32dc2435ab65"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "850e4a5bdfde87379958ea8d43524e0a9fa917fd29445802758fa7954f30fa8f"
    end
    on_intel do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b30c5abdd9c01892b26c8cd23ace7741ba6d1fceee2c260395b6eacf5b8a93e4"
    end
  end

  def install
    bin.install "repopilot"
  end

  test do
    system "#{bin}/repopilot", "--version"
  end
end
