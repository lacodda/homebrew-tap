# Written by tools/update.py from packages.json and the v0.27.0 release - edit those, not this file.
class Turnout < Formula
  desc "Point local apps at any backend stand, keep servers and secrets, and deploy"
  homepage "https://lacodda.github.io/turnout/"
  version "0.27.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lacodda/turnout/releases/download/v0.27.0/turnout-v0.27.0-aarch64-apple-darwin.tar.gz"
      sha256 "6935ab3f73cf93c8a122cffc9eace769be79ca82e348e165071ea529002b3b02"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lacodda/turnout/releases/download/v0.27.0/turnout-v0.27.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dc6194a8100b29578d16ffea4043aa49f1085a69efa318ce3867e6a3d6913507"
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
