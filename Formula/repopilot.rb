# Template used by the release workflow to auto-update the Homebrew tap.
# 0.24.0, 448a3fad4863fac7d60746b9347e7e064d8b1c4ee8eeae16da0e698cf0e28c4b, 18a66986520b31d680fb70c832a9e50ce1c4c2f962590c61c0b46d8764a40030, 1e885d49c83ea1a2b9a5d36eb1552acf8052e1991634c3c0c764d71346f41eb4,
# a79d6fb789d3e4e94b17df76839c96ae7d43b777ec394c7cbebc26cccf4d86b6 are replaced by the update-homebrew-tap CI job.
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
  version "0.24.0"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "448a3fad4863fac7d60746b9347e7e064d8b1c4ee8eeae16da0e698cf0e28c4b"
    end
    on_intel do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "18a66986520b31d680fb70c832a9e50ce1c4c2f962590c61c0b46d8764a40030"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1e885d49c83ea1a2b9a5d36eb1552acf8052e1991634c3c0c764d71346f41eb4"
    end
    on_intel do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a79d6fb789d3e4e94b17df76839c96ae7d43b777ec394c7cbebc26cccf4d86b6"
    end
  end

  def install
    bin.install "repopilot"
  end

  test do
    system "#{bin}/repopilot", "--version"
  end
end
