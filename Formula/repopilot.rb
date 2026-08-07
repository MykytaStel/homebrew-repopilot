# Template used by the release workflow to auto-update the Homebrew tap.
# 0.21.0, 8e49ad23078576aa58fbee20729bc22a1cc3eb3581d676abd0ac3242985e80bc, 0539fa8ec3ed65c325740192d34420476cc3e7daefaa12c209a89c60edd5472f, 15f8df19facfb081dc504abc18916a29b0d86079c2ee4751c969c597a380a63b,
# df00a1e1505012586836e8f0804825101df8e0606b30524c6ec380ba13924e1f are replaced by the update-homebrew-tap CI job.
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
  version "0.21.0"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "8e49ad23078576aa58fbee20729bc22a1cc3eb3581d676abd0ac3242985e80bc"
    end
    on_intel do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "0539fa8ec3ed65c325740192d34420476cc3e7daefaa12c209a89c60edd5472f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "15f8df19facfb081dc504abc18916a29b0d86079c2ee4751c969c597a380a63b"
    end
    on_intel do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "df00a1e1505012586836e8f0804825101df8e0606b30524c6ec380ba13924e1f"
    end
  end

  def install
    bin.install "repopilot"
  end

  test do
    system "#{bin}/repopilot", "--version"
  end
end
