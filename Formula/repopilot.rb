# Template used by the release workflow to auto-update the Homebrew tap.
# 0.20.0, d930a6f4282fc5c168bc4de9a73b4280271ebb617e049948a3789c4f5185cb6b, db230431b509b93eae848a5dc3ce59ff6638542ebd3da49e0b89d08b078734a6, c4bcc4d954ff1fb4921d21a3d9f7b8b5bc4a4bbd505af221d41162d7a867d287,
# 7735feae0f7e09ea88d5b655228fd49c54db77015d21ac49f6f78983d99140c5 are replaced by the update-homebrew-tap CI job.
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
  version "0.20.0"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "d930a6f4282fc5c168bc4de9a73b4280271ebb617e049948a3789c4f5185cb6b"
    end
    on_intel do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "db230431b509b93eae848a5dc3ce59ff6638542ebd3da49e0b89d08b078734a6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c4bcc4d954ff1fb4921d21a3d9f7b8b5bc4a4bbd505af221d41162d7a867d287"
    end
    on_intel do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7735feae0f7e09ea88d5b655228fd49c54db77015d21ac49f6f78983d99140c5"
    end
  end

  def install
    bin.install "repopilot"
  end

  test do
    system "#{bin}/repopilot", "--version"
  end
end
