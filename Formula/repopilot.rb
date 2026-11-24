# Template used by the release workflow to auto-update the Homebrew tap.
# 0.28.0, 385aa25259120d6617746ef9022ed0b7a085e81e00d6f39f47790080f3cba2bc, 912749c56e5b021a66ada7c38c4f7bba9937e4a498a86f11a0abefd5a11632e7, 321c9bf33982734a28e0789886220849b6ddfffedc47ddf77062905a20f7936c,
# b795c73dd10eb74644568604bc30306fd0f3ecd16334295759183c9731b35944 are replaced by the update-homebrew-tap CI job.
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
  version "0.28.0"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "385aa25259120d6617746ef9022ed0b7a085e81e00d6f39f47790080f3cba2bc"
    end
    on_intel do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "912749c56e5b021a66ada7c38c4f7bba9937e4a498a86f11a0abefd5a11632e7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "321c9bf33982734a28e0789886220849b6ddfffedc47ddf77062905a20f7936c"
    end
    on_intel do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b795c73dd10eb74644568604bc30306fd0f3ecd16334295759183c9731b35944"
    end
  end

  def install
    bin.install "repopilot"
  end

  test do
    system "#{bin}/repopilot", "--version"
  end
end
