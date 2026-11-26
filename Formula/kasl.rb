# Written by tools/update.py from packages.json and the v1.25.0 release - edit those, not this file.
class Kasl < Formula
  desc "Work activity tracker: workday and break detection, tasks and reports"
  homepage "https://kasl.lacodda.com"
  version "1.25.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lacodda/kasl/releases/download/v1.25.0/kasl-v1.25.0-aarch64-apple-darwin.tar.gz"
      sha256 "49d446ecbd142dd2b4cc5ec755ca5faa35de37c9d6c1042540e93e545856717b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lacodda/kasl/releases/download/v1.25.0/kasl-v1.25.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e69369908ef40d59a9b4992230e0b3ad9744fa666929100fd33dffc6abb4551b"
    end
  end

  def install
    bin.install "kasl"
    bin.install "kasl-plugin-gitlab"
    bin.install_symlink "kasl" => "ka"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kasl --version")
  end
end
