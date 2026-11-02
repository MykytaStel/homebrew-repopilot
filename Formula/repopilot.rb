# Template used by the release workflow to auto-update the Homebrew tap.
# 0.26.0, 0ac91153366618de631d15426c5d5ba39b21ad824c2f4535cf33995143baacd5, caede04e89849d0feb2d9d6d7af15fb0cd5b6488ccfe1199d6576594561a8da9, ece9d578b8909e5cdfc0f740f25b6a23a22b1089957f011e62b91c1dde35255b,
# a5be73996bb72530fee1f88a59e40ccc00bc56464bfcaf21918fed8f3a56c753 are replaced by the update-homebrew-tap CI job.
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
  version "0.26.0"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "0ac91153366618de631d15426c5d5ba39b21ad824c2f4535cf33995143baacd5"
    end
    on_intel do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "caede04e89849d0feb2d9d6d7af15fb0cd5b6488ccfe1199d6576594561a8da9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ece9d578b8909e5cdfc0f740f25b6a23a22b1089957f011e62b91c1dde35255b"
    end
    on_intel do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a5be73996bb72530fee1f88a59e40ccc00bc56464bfcaf21918fed8f3a56c753"
    end
  end

  def install
    bin.install "repopilot"
  end

  test do
    system "#{bin}/repopilot", "--version"
  end
end
