# Template used by the release workflow to auto-update the Homebrew tap.
# 0.25.0, 63dfe4abe2f9ba93f56935097541463ef5719ac8cee72d408739b4d7d9cacd11, d9c19a07d63cf7f623175775864d4bbb5444214d85b71c8c573949c889a2088a, 9f6aa7bf19459956d8c9555c2783cfbd12df80ae3f505618f52fd4f12423a556,
# b8c2534f50dc8b36054a6c71d9bee4d75ebd7deb4f33c36976696931b8a96154 are replaced by the update-homebrew-tap CI job.
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
  version "0.25.0"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "63dfe4abe2f9ba93f56935097541463ef5719ac8cee72d408739b4d7d9cacd11"
    end
    on_intel do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "d9c19a07d63cf7f623175775864d4bbb5444214d85b71c8c573949c889a2088a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9f6aa7bf19459956d8c9555c2783cfbd12df80ae3f505618f52fd4f12423a556"
    end
    on_intel do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b8c2534f50dc8b36054a6c71d9bee4d75ebd7deb4f33c36976696931b8a96154"
    end
  end

  def install
    bin.install "repopilot"
  end

  test do
    system "#{bin}/repopilot", "--version"
  end
end
