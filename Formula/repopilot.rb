# Template used by the release workflow to auto-update the Homebrew tap.
# 0.14.0, 882f318ee822b9689d5909385d839209586560eedd62d09c733c301c1f232b4d, ca12efa095f2afdadde74a70c89cf7b68c135eff14acfdb9e23d15c24d5f1240, 8ed9d2d5c107a747f524953440bd3d33c1afec6288c6d0f4f9ed50b65ef1431b,
# 2f3c1c3bfac81f04bdde3dbf715f8617bcb1b18b3d541b3f5db267d5189fb1a1 are replaced by the update-homebrew-tap CI job.
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
  version "0.14.0"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "882f318ee822b9689d5909385d839209586560eedd62d09c733c301c1f232b4d"
    end
    on_intel do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "ca12efa095f2afdadde74a70c89cf7b68c135eff14acfdb9e23d15c24d5f1240"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8ed9d2d5c107a747f524953440bd3d33c1afec6288c6d0f4f9ed50b65ef1431b"
    end
    on_intel do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2f3c1c3bfac81f04bdde3dbf715f8617bcb1b18b3d541b3f5db267d5189fb1a1"
    end
  end

  def install
    bin.install "repopilot"
  end

  test do
    system "#{bin}/repopilot", "--version"
  end
end
