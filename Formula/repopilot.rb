# Template used by the release workflow to auto-update the Homebrew tap.
# 0.12.0, cb8345f84caee33ecdefd844248e68335f6a68c3c346d40ddc9e63413831f3b9, 50e821feb6195b02e855d8e42e076980dc970aa4130498522aeafc0b53f1ed5c, 7df2bf6ffdc4630bdeb7cb9d14c09318a0438fbe1fe045edca72714b4ea57ed2,
# 3841a0242472ffa2f97dc85ee0867d2cfe41e9794c284068cf8a605bf4cb8182 are replaced by the update-homebrew-tap CI job.
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
  version "0.12.0"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "cb8345f84caee33ecdefd844248e68335f6a68c3c346d40ddc9e63413831f3b9"
    end
    on_intel do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "50e821feb6195b02e855d8e42e076980dc970aa4130498522aeafc0b53f1ed5c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7df2bf6ffdc4630bdeb7cb9d14c09318a0438fbe1fe045edca72714b4ea57ed2"
    end
    on_intel do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3841a0242472ffa2f97dc85ee0867d2cfe41e9794c284068cf8a605bf4cb8182"
    end
  end

  def install
    bin.install "repopilot"
  end

  test do
    system "#{bin}/repopilot", "--version"
  end
end
