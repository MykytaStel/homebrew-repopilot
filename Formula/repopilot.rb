# Template used by the release workflow to auto-update the Homebrew tap.
# 0.24.1, 6bf89203c9bb8df04e29d386e895d269c24750343f827640327b38123c21fcd7, 4e64e683a477655c71a82183ef931e8084b36a535459e9da58e570c7f2bb5afe, 3343e5bef21f42f5b8825c726715b39fc57309b04a1186984e94ff21918145de,
# 18e31aa1e285e3778cf21b2bd1ed841157e41a4c29d5f4fea71724bff8b829fd are replaced by the update-homebrew-tap CI job.
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
  version "0.24.1"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "6bf89203c9bb8df04e29d386e895d269c24750343f827640327b38123c21fcd7"
    end
    on_intel do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "4e64e683a477655c71a82183ef931e8084b36a535459e9da58e570c7f2bb5afe"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3343e5bef21f42f5b8825c726715b39fc57309b04a1186984e94ff21918145de"
    end
    on_intel do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "18e31aa1e285e3778cf21b2bd1ed841157e41a4c29d5f4fea71724bff8b829fd"
    end
  end

  def install
    bin.install "repopilot"
  end

  test do
    system "#{bin}/repopilot", "--version"
  end
end
