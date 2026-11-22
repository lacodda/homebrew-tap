# Written by tools/update.py from packages.json and the v2.22.1 release - edit those, not this file.
class Lyrn < Formula
  desc "Start a new web application on the lacodda line's stack with one command"
  homepage "https://lyrn.lacodda.com"
  version "2.22.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lacodda/lyrn/releases/download/v2.22.1/lyrn-v2.22.1-aarch64-apple-darwin.tar.gz"
      sha256 "2d6dec5af369afe2464b907318505d656b8a42f8d5f789543be85286ebd87dad"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lacodda/lyrn/releases/download/v2.22.1/lyrn-v2.22.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8d648af8dae82183a71b0421dbefbd0aad068c958e99dd5d4bfc7bdcf1e539c8"
    end
  end

  def install
    bin.install "lyrn"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lyrn --version")
  end
end
