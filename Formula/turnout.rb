# Written by tools/update.py from packages.json and the v1.0.0 release - edit those, not this file.
class Turnout < Formula
  desc "Point local apps at any backend stand, keep servers and secrets, and deploy"
  homepage "https://lacodda.github.io/turnout/"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lacodda/turnout/releases/download/v1.0.0/turnout-v1.0.0-aarch64-apple-darwin.tar.gz"
      sha256 "1b0d9ae4e5115cbb98dd746adc17bfe1ecbabfab4127c325e48c475bb18b26ea"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lacodda/turnout/releases/download/v1.0.0/turnout-v1.0.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8f3be7e2c7d19b906d98c5fcfe871c4172f31d4e75205ed74d8498d86b0b1426"
    end
    on_arm do
      url "https://github.com/lacodda/turnout/releases/download/v1.0.0/turnout-v1.0.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "683cfa3970b0bd45466984f240ce6f85fdb6c855fe6effbb371dafd077499f40"
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
