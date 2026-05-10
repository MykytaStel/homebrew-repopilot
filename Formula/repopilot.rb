# Template used by the release workflow to auto-update the Homebrew tap.
# 0.8.0, 2a0af9d8103566afa24722afb7664e5ea81f026583fe3aed04577c787fd51bcc, e2cd9590ff57d77b1e0bf7e3a02a1c4ae516aeae16ee03fe6f280c6f7131a0a3, 545e47c39cfa98678a84de372891bf445e7fd5fe3e78b6cfb7233b22b2e21373,
# 9b3b93d3075f2656340a89a8cde7b8c4043aedcd6e045fb2817ab565433df1a2 are replaced by the update-homebrew-tap CI job.
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
  version "0.8.0"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "2a0af9d8103566afa24722afb7664e5ea81f026583fe3aed04577c787fd51bcc"
    end
    on_intel do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "e2cd9590ff57d77b1e0bf7e3a02a1c4ae516aeae16ee03fe6f280c6f7131a0a3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "545e47c39cfa98678a84de372891bf445e7fd5fe3e78b6cfb7233b22b2e21373"
    end
    on_intel do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9b3b93d3075f2656340a89a8cde7b8c4043aedcd6e045fb2817ab565433df1a2"
    end
  end

  def install
    bin.install "repopilot"
  end

  test do
    system "#{bin}/repopilot", "--version"
  end
end
