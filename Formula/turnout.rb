# Written by tools/update.py from packages.json and the v1.2.0 release - edit those, not this file.
class Turnout < Formula
  desc "Point local apps at any backend stand, keep servers and secrets, and deploy"
  homepage "https://lacodda.github.io/turnout/"
  version "1.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lacodda/turnout/releases/download/v1.2.0/turnout-v1.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "e1ddbbcd5336e5343e5ec06669e857137d2c103701c68af1e2f34cc0fc6ef93c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lacodda/turnout/releases/download/v1.2.0/turnout-v1.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1bdba6b47acb9a090a550d733f24aaef9f6fd9361d441e4c09859edd043c35da"
    end
    on_arm do
      url "https://github.com/lacodda/turnout/releases/download/v1.2.0/turnout-v1.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0fb03d4cba0f564f33d40c599022248c55b2d6278015a3d4310567e3480714cc"
    end
  end

  def install
    bin.install "turnout"
    bin.install_symlink "turnout" => "tn"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/turnout --version")
  end
end
