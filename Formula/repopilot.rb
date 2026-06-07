# Template used by the release workflow to auto-update the Homebrew tap.
# 0.16.0, b73987f763cd94db9deb0893d8718c350d254bc64697ea69b4df622a79ce48e4, 6e021dbc9e4b28c516ecf540f9699cc784f764af92af8efbdf031ea4b42d718c, 8417ca47affa02a785ef1caa71d64e95383e9ed1ca01735479b741ef0d14e8f7,
# 7135c0c236eeac75b86dd483b283b30679482bc7577cba62bd48e2c9df8bbd16 are replaced by the update-homebrew-tap CI job.
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
  version "0.16.0"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "b73987f763cd94db9deb0893d8718c350d254bc64697ea69b4df622a79ce48e4"
    end
    on_intel do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "6e021dbc9e4b28c516ecf540f9699cc784f764af92af8efbdf031ea4b42d718c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8417ca47affa02a785ef1caa71d64e95383e9ed1ca01735479b741ef0d14e8f7"
    end
    on_intel do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7135c0c236eeac75b86dd483b283b30679482bc7577cba62bd48e2c9df8bbd16"
    end
  end

  def install
    bin.install "repopilot"
  end

  test do
    system "#{bin}/repopilot", "--version"
  end
end
