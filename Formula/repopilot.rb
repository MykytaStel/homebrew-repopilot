# Template used by the release workflow to auto-update the Homebrew tap.
# 0.18.0, db4e8296fa6cd74c196fdee66c12db9357bc5626673c028490bad7d08fc88539, b66739f83075e0099ef1432840f5fcf7a8340840668ce83049c78d87c6ba198c, c739dd33ac3133894e41b8dd54533c910dc7c70698625083a48edd89090efaf5,
# d9f30d266e0a239f96b8a516fde65192267da8d6c27eb9eb77e614c9963c1462 are replaced by the update-homebrew-tap CI job.
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
  version "0.18.0"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "db4e8296fa6cd74c196fdee66c12db9357bc5626673c028490bad7d08fc88539"
    end
    on_intel do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "b66739f83075e0099ef1432840f5fcf7a8340840668ce83049c78d87c6ba198c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c739dd33ac3133894e41b8dd54533c910dc7c70698625083a48edd89090efaf5"
    end
    on_intel do
      url "https://github.com/MykytaStel/repopilot/releases/download/v#{version}/repopilot-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d9f30d266e0a239f96b8a516fde65192267da8d6c27eb9eb77e614c9963c1462"
    end
  end

  def install
    bin.install "repopilot"
  end

  test do
    system "#{bin}/repopilot", "--version"
  end
end
