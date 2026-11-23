# Written by tools/update.py from packages.json and the v1.3.0 release - edit those, not this file.
class Turnout < Formula
  desc "Point local apps at any backend stand, keep servers and secrets, and deploy"
  homepage "https://lacodda.github.io/turnout/"
  version "1.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lacodda/turnout/releases/download/v1.3.0/turnout-v1.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "c46e5cd05b6992f8b04fe876f0a55c5d8627c88896a56fd86cd6cd5c61ed6d05"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lacodda/turnout/releases/download/v1.3.0/turnout-v1.3.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3d8af2fba5a8c244938f4fc9f74278785afa8322553d3658d3639529f89e5c31"
    end
    on_arm do
      url "https://github.com/lacodda/turnout/releases/download/v1.3.0/turnout-v1.3.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b01a5b5a83688383d7ecdde8da8a59fe83ebe238e3beb810894289606e4ce24b"
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
