# Written by tools/update.py from packages.json and the v1.0.1 release - edit those, not this file.
class Turnout < Formula
  desc "Point local apps at any backend stand, keep servers and secrets, and deploy"
  homepage "https://lacodda.github.io/turnout/"
  version "1.0.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lacodda/turnout/releases/download/v1.0.1/turnout-v1.0.1-aarch64-apple-darwin.tar.gz"
      sha256 "f7a825820344a54c3890a8ceecd9d437e550bcce7d59fd54d9fa29cb9d42d956"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lacodda/turnout/releases/download/v1.0.1/turnout-v1.0.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1841d8a1bc70ad2e9db7da9b3a7817f94557b5e19c4f0a19b6d09eddbab7dfe2"
    end
    on_arm do
      url "https://github.com/lacodda/turnout/releases/download/v1.0.1/turnout-v1.0.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f96a815126210d3850924af97d5b6f591717fecdf669b7e5e357531c3aa4bd01"
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
