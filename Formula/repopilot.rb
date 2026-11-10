# Template used by the release workflow to auto-update the Homebrew tap.
# 0.27.0, 4cbba695a1aa3ed85757218545907dc76968a6183cec42a6eb217764e340c9a6, 180102fd1580e32c7527dd1095ba388862a40cc04bcd952249d18a8303d8bf93, 9ccab2230528b636c4357b6272d65bc187a013d8cde73720d903ce4b864793ea,
# 7538cca583330a7bc18d294a698165c147841182b1507a1e990a2d8fa0ad4e9f are replaced by the update-homebrew-tap CI job.
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
  version "0.27.0"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "4cbba695a1aa3ed85757218545907dc76968a6183cec42a6eb217764e340c9a6"
    end
    on_intel do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "180102fd1580e32c7527dd1095ba388862a40cc04bcd952249d18a8303d8bf93"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9ccab2230528b636c4357b6272d65bc187a013d8cde73720d903ce4b864793ea"
    end
    on_intel do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7538cca583330a7bc18d294a698165c147841182b1507a1e990a2d8fa0ad4e9f"
    end
  end

  def install
    bin.install "repopilot"
  end

  test do
    system "#{bin}/repopilot", "--version"
  end
end
