# Template used by the release workflow to auto-update the Homebrew tap.
# 0.7.0, cc76119ad5ffd9ccf79c6df0a7b59724754498bc19928cc02ee78887449601c4, 1c2cdc31504edb6b69dfe91a6318438e71ddb4dddaa2566d12c2bacbe92e4e4c, 7afc3bf91d9db6a958f3f08e3db3ea614eabd760ddafbb24b21231dad87a953d,
# 965a02264e63cb817e5519000de98a23e34a82370b7510955280810ab6d2e92d are replaced by the update-homebrew-tap CI job.
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
  version "0.7.0"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "cc76119ad5ffd9ccf79c6df0a7b59724754498bc19928cc02ee78887449601c4"
    end
    on_intel do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "1c2cdc31504edb6b69dfe91a6318438e71ddb4dddaa2566d12c2bacbe92e4e4c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7afc3bf91d9db6a958f3f08e3db3ea614eabd760ddafbb24b21231dad87a953d"
    end
    on_intel do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "965a02264e63cb817e5519000de98a23e34a82370b7510955280810ab6d2e92d"
    end
  end

  def install
    bin.install "repopilot"
  end

  test do
    system "#{bin}/repopilot", "--version"
  end
end
