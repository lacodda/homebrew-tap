# Written by tools/update.py from packages.json and the v2.21.0 release - edit those, not this file.
class Lyrn < Formula
  desc "Start a new web application on the lacodda line's stack with one command"
  homepage "https://lyrn.lacodda.com"
  version "2.21.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lacodda/lyrn/releases/download/v2.21.0/lyrn-v2.21.0-aarch64-apple-darwin.tar.gz"
      sha256 "e60ea6769f6931ccfa0d46f883c2f00118448155b606e0435216971d13a2691d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lacodda/lyrn/releases/download/v2.21.0/lyrn-v2.21.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ba985e8a3f224bd0af9532552a20c953826e19b15e57ba1545b736e75edd2887"
    end
  end

  def install
    bin.install "lyrn"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lyrn --version")
  end
end
