# Written by tools/update.py from packages.json and the v0.11.0 release - edit those, not this file.
class EfemaServer < Formula
  desc "Sync relay for local-first apps: it keeps changes in order and cannot read them"
  homepage "https://lacodda.github.io/efema/"
  version "0.11.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lacodda/efema/releases/download/v0.11.0/efema-server-v0.11.0-aarch64-apple-darwin.tar.gz"
      sha256 "24b20c92195e808c883d9a4acf783fe2cf76c201194273eb5187194427dc986c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lacodda/efema/releases/download/v0.11.0/efema-server-v0.11.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b9ca791308ca377ddef58084ac69d62752626e3ef5eb1166e5bca7883159c81f"
    end
    on_arm do
      url "https://github.com/lacodda/efema/releases/download/v0.11.0/efema-server-v0.11.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b9ece7001ff9c5dc6c64367a1c30eb0909272c24478f19d9d4dc30f6e9f2dc6d"
    end
  end

  def install
    bin.install "efema-server"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/efema-server --version")
  end
end
