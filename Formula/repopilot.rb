# Template used by the release workflow to auto-update the Homebrew tap.
# 0.22.0, 14e6b20e4f37ef1e6700656a55642891435ad3b00562f9b4ea6f5d0a4ab4bc9c, fa12d9cfb13c3cd65ac40d48d060ff3b029dd3eaec21ba5c482edd1dcc8ad1ba, 2e409c9110415579fc77fec8fa35e9dafb4be30f0fcca915feffddef13b27276,
# 3afe173e05824edad059347ca99d148d61410cd01809f365c17f81e32e7d7463 are replaced by the update-homebrew-tap CI job.
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
  version "0.22.0"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "14e6b20e4f37ef1e6700656a55642891435ad3b00562f9b4ea6f5d0a4ab4bc9c"
    end
    on_intel do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "fa12d9cfb13c3cd65ac40d48d060ff3b029dd3eaec21ba5c482edd1dcc8ad1ba"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2e409c9110415579fc77fec8fa35e9dafb4be30f0fcca915feffddef13b27276"
    end
    on_intel do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3afe173e05824edad059347ca99d148d61410cd01809f365c17f81e32e7d7463"
    end
  end

  def install
    bin.install "repopilot"
  end

  test do
    system "#{bin}/repopilot", "--version"
  end
end
