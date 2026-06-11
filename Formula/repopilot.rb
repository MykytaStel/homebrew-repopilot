# Template used by the release workflow to auto-update the Homebrew tap.
# 0.17.0, 576961f17923048ec5def0145a137119d7a3590413b2b9256b6acb36ae6689f7, 342bcd978b9184a82d4e51a97f8da3e48fec0cdadead7db8c0ee2d9d94cb6747, 1f543dcad789d09f5e56136501a63ead85ccd6d3bcbef8ef670c18a8e0a04ed0,
# dcf89992c698fdae123164016f8aac29001cbe08f10d762b081e5c93212b9397 are replaced by the update-homebrew-tap CI job.
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
  version "0.17.0"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "576961f17923048ec5def0145a137119d7a3590413b2b9256b6acb36ae6689f7"
    end
    on_intel do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "342bcd978b9184a82d4e51a97f8da3e48fec0cdadead7db8c0ee2d9d94cb6747"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1f543dcad789d09f5e56136501a63ead85ccd6d3bcbef8ef670c18a8e0a04ed0"
    end
    on_intel do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dcf89992c698fdae123164016f8aac29001cbe08f10d762b081e5c93212b9397"
    end
  end

  def install
    bin.install "repopilot"
  end

  test do
    system "#{bin}/repopilot", "--version"
  end
end
