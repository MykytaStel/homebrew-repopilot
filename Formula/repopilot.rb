# Template used by the release workflow to auto-update the Homebrew tap.
# 0.23.0, 6d64259454c7f1a4ce8f3a3df37b782ad8ab2ac67de6b9058f77ec2934638fe3, cfc718cd5e847ffd39bbc48bbeb47c98a7722d60f3e96a2248dfcbf5c998e5fb, 622781ce28ebf67226fc7bbd826f9aa0381e349739a87c424423488d01f7a9f5,
# f3bbabda204b21b32796037b09e6da0ca3babb00d0eaa5f732f23fcc861d38b6 are replaced by the update-homebrew-tap CI job.
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
  version "0.23.0"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "6d64259454c7f1a4ce8f3a3df37b782ad8ab2ac67de6b9058f77ec2934638fe3"
    end
    on_intel do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "cfc718cd5e847ffd39bbc48bbeb47c98a7722d60f3e96a2248dfcbf5c998e5fb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "622781ce28ebf67226fc7bbd826f9aa0381e349739a87c424423488d01f7a9f5"
    end
    on_intel do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f3bbabda204b21b32796037b09e6da0ca3babb00d0eaa5f732f23fcc861d38b6"
    end
  end

  def install
    bin.install "repopilot"
  end

  test do
    system "#{bin}/repopilot", "--version"
  end
end
