# Template used by the release workflow to auto-update the Homebrew tap.
# 0.15.0, d32e7bebe061b97148ccf1663211a7ee0440f052f38953aa9b78a571991f8ada, e0436f469ff5fd417e57d6192e63ded9ba79cc73de2c508772c247d21bf9fbce, 8835481ca4c29e1477c164703519372b14bf067db4bcbf8ca29fb35652451f6e,
# 87cd1a9de0eaeba0eb1cab4a0e04dc3966075c3676f8c12936a7803f7d662204 are replaced by the update-homebrew-tap CI job.
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
  version "0.15.0"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "d32e7bebe061b97148ccf1663211a7ee0440f052f38953aa9b78a571991f8ada"
    end
    on_intel do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "e0436f469ff5fd417e57d6192e63ded9ba79cc73de2c508772c247d21bf9fbce"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8835481ca4c29e1477c164703519372b14bf067db4bcbf8ca29fb35652451f6e"
    end
    on_intel do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "87cd1a9de0eaeba0eb1cab4a0e04dc3966075c3676f8c12936a7803f7d662204"
    end
  end

  def install
    bin.install "repopilot"
  end

  test do
    system "#{bin}/repopilot", "--version"
  end
end
