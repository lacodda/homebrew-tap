# Written by tools/update.py from packages.json and the v1.1.0 release - edit those, not this file.
class Turnout < Formula
  desc "Point local apps at any backend stand, keep servers and secrets, and deploy"
  homepage "https://lacodda.github.io/turnout/"
  version "1.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lacodda/turnout/releases/download/v1.1.0/turnout-v1.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "f593c9eb5c34ac7d217b863c8aa09ff36ab97505b8f9cfcac03bce330d12b3cd"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lacodda/turnout/releases/download/v1.1.0/turnout-v1.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dc84ef3a4d9f47583c4a548415f25f55fc2a5a0f692846f6faccf56e6259fd2f"
    end
    on_arm do
      url "https://github.com/lacodda/turnout/releases/download/v1.1.0/turnout-v1.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "49f92b598150d08d9ed4b21888254fe25a4bd0aa40cfaf6001f3acb93eb7b95e"
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
