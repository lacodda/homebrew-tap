# Written by tools/update.py from packages.json and the v1.24.0 release - edit those, not this file.
class Kasl < Formula
  desc "Work activity tracker: workday and break detection, tasks and reports"
  homepage "https://kasl.lacodda.com"
  version "1.24.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lacodda/kasl/releases/download/v1.24.0/kasl-v1.24.0-aarch64-apple-darwin.tar.gz"
      sha256 "acbbb306ead5b166074a1a8a391b1cc8598a5dad9a997c8e46b8f7ec8cd5dbe5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lacodda/kasl/releases/download/v1.24.0/kasl-v1.24.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "af9648679eed389c928915b761811c2174629f9b935c801ca7e3d9bb642e32dc"
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
