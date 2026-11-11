# Written by tools/update.py from packages.json and the v0.10.0 release - edit those, not this file.
class EfemaServer < Formula
  desc "Sync relay for local-first apps: it keeps changes in order and cannot read them"
  homepage "https://lacodda.github.io/efema/"
  version "0.10.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lacodda/efema/releases/download/v0.10.0/efema-server-v0.10.0-aarch64-apple-darwin.tar.gz"
      sha256 "32ccd5909f484c295e7b9dd077ffdb70027ab7d75ca27a2466819a10e33b9d5a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lacodda/efema/releases/download/v0.10.0/efema-server-v0.10.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "be4c371b517555e582fac9f3542e24b05e10f0a7dff45cc298d97ad360f09df5"
    end
    on_arm do
      url "https://github.com/lacodda/efema/releases/download/v0.10.0/efema-server-v0.10.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5504dea02e84f7554fd943885ee84642ff9f2055c65e23a99e4372de5cc954b2"
    end
  end

  def install
    bin.install "efema-server"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/efema-server --version")
  end
end
