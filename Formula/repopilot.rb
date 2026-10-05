# Template used by the release workflow to auto-update the Homebrew tap.
# 0.24.3, e861cd74bb2490c409f09626052585ce51540f6c09726803a5c9548718529952, 0778521a93eb21b480a8294846a79ed1acac2ae817333ddf89e362f9488d68b3, 6d32970b0c387e73d36b744b8f168d86ff2836576791a6b6b4bc49c0c4343b59,
# 638b7674c3d31fd1912664896a635cdd7910e15dd553589abc9a7b8bfa3bcda4 are replaced by the update-homebrew-tap CI job.
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
  version "0.24.3"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "e861cd74bb2490c409f09626052585ce51540f6c09726803a5c9548718529952"
    end
    on_intel do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "0778521a93eb21b480a8294846a79ed1acac2ae817333ddf89e362f9488d68b3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6d32970b0c387e73d36b744b8f168d86ff2836576791a6b6b4bc49c0c4343b59"
    end
    on_intel do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "638b7674c3d31fd1912664896a635cdd7910e15dd553589abc9a7b8bfa3bcda4"
    end
  end

  def install
    bin.install "repopilot"
  end

  test do
    system "#{bin}/repopilot", "--version"
  end
end
