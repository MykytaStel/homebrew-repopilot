# Template used by the release workflow to auto-update the Homebrew tap.
# 0.11.0, fb03daca2a4d729a15dd1023a619a2a92961cba6f4ff4149f1fef5e2c4aaf33c, 9374d2b478f7fdb5e5f224cf04590462628108c0fc0e89404249608d3c46ee74, 0297a6ef490f8578e6ab866c4222da63af282a519aebdf611398449e41ee22c2,
# 029e7dcb26f67565f409ebe08c16d8f2315adc486320892381937085d5208f75 are replaced by the update-homebrew-tap CI job.
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
  version "0.11.0"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "fb03daca2a4d729a15dd1023a619a2a92961cba6f4ff4149f1fef5e2c4aaf33c"
    end
    on_intel do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "9374d2b478f7fdb5e5f224cf04590462628108c0fc0e89404249608d3c46ee74"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0297a6ef490f8578e6ab866c4222da63af282a519aebdf611398449e41ee22c2"
    end
    on_intel do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "029e7dcb26f67565f409ebe08c16d8f2315adc486320892381937085d5208f75"
    end
  end

  def install
    bin.install "repopilot"
  end

  test do
    system "#{bin}/repopilot", "--version"
  end
end
