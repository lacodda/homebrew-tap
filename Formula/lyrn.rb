# Written by tools/update.py from packages.json and the v2.20.0 release - edit those, not this file.
class Lyrn < Formula
  desc "Start a new web application on the lacodda line's stack with one command"
  homepage "https://lyrn.lacodda.com"
  version "2.20.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lacodda/lyrn/releases/download/v2.20.0/lyrn-v2.20.0-aarch64-apple-darwin.tar.gz"
      sha256 "4a01346fd34030bb496f9bbddd7d339d18701463ee716649539af6601cfdaa9b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lacodda/lyrn/releases/download/v2.20.0/lyrn-v2.20.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a59d3231df90986a9a6289e5850c5c4532d9d86306095ad66925e3d9953e6a47"
    end
  end

  def install
    bin.install "lyrn"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lyrn --version")
  end
end
