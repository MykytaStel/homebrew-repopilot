# Template used by the release workflow to auto-update the Homebrew tap.
# 0.13.0, 0a69cb63440ad8637b8d365b8f84aa0ce6558a34249b13542e65ff761ab7092e, 584014b1bcb79ea23507abaa688a222297dc34f7442b286d1ea7dcae262b3e78, dbafff285a2687bad06d53312f11a5b9fa48f64933aaf19e0d3fd5cf77917b84,
# 7e63ee3880ca6636ae5f23e3a605a3a505dfd98a10eb553cbee0444e4ceb5d7c are replaced by the update-homebrew-tap CI job.
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
  version "0.13.0"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "0a69cb63440ad8637b8d365b8f84aa0ce6558a34249b13542e65ff761ab7092e"
    end
    on_intel do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "584014b1bcb79ea23507abaa688a222297dc34f7442b286d1ea7dcae262b3e78"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dbafff285a2687bad06d53312f11a5b9fa48f64933aaf19e0d3fd5cf77917b84"
    end
    on_intel do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7e63ee3880ca6636ae5f23e3a605a3a505dfd98a10eb553cbee0444e4ceb5d7c"
    end
  end

  def install
    bin.install "repopilot"
  end

  test do
    system "#{bin}/repopilot", "--version"
  end
end
