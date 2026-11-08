#!/usr/bin/env python3
"""Write every formula in Formula/ from packages.json and the newest release.

One package is one entry in packages.json: the GitHub repository it is
released from, how it describes itself, the program and its aliases. The
formula is never edited by hand - the next run would write over it - so a
change goes into packages.json or into this script.

For each package the newest GitHub release is read, every archive the formula
needs is downloaded and hashed, and Formula/<name>.rb is rendered. A target
the release does not carry is left out of the formula rather than guessed.
Run with no arguments; GITHUB_TOKEN, when set, lifts the API's rate limit.
"""

import hashlib
import json
import os
import pathlib
import sys
import urllib.request

ROOT = pathlib.Path(__file__).resolve().parent.parent

# Homebrew's platform blocks, and the Rust target each one takes.
PLATFORMS = [
    ("on_macos", "on_arm", "aarch64-apple-darwin"),
    ("on_macos", "on_intel", "x86_64-apple-darwin"),
    ("on_linux", "on_intel", "x86_64-unknown-linux-gnu"),
    ("on_linux", "on_arm", "aarch64-unknown-linux-gnu"),
]


def fetch(url, accept="application/octet-stream"):
    headers = {"User-Agent": "lacodda-homebrew-tap", "Accept": accept}
    token = os.environ.get("GITHUB_TOKEN")
    if token and url.startswith("https://api.github.com/"):
        headers["Authorization"] = f"Bearer {token}"
    with urllib.request.urlopen(urllib.request.Request(url, headers=headers), timeout=120) as reply:
        return reply.read()


def latest(repo):
    release = json.loads(fetch(f"https://api.github.com/repos/{repo}/releases/latest", "application/vnd.github+json"))
    return release["tag_name"], {asset["name"]: asset["browser_download_url"] for asset in release["assets"]}


def class_name(name):
    return "".join(part.capitalize() for part in name.replace("_", "-").split("-"))


def render(package, tag, assets):
    name, version = package["name"], tag.removeprefix("v")
    blocks = {}
    for os_block, arch_block, target in PLATFORMS:
        archive = f"{name}-{tag}-{target}.tar.gz"
        if archive not in assets:
            continue
        sha256 = hashlib.sha256(fetch(assets[archive])).hexdigest()
        blocks.setdefault(os_block, []).append(
            f'    {arch_block} do\n      url "{assets[archive]}"\n      sha256 "{sha256}"\n    end'
        )
    if not blocks:
        sys.exit(f"{package['repo']} {tag} carries no archive this tap installs")
    platforms = "\n\n".join(f"  {os_block} do\n" + "\n".join(arches) + "\n  end" for os_block, arches in blocks.items())
    install = [f'    bin.install "{package["bin"]}"']
    install += [f'    bin.install_symlink "{package["bin"]}" => "{alias}"' for alias in package.get("aliases", [])]
    return f'''# Written by tools/update.py from packages.json and the {tag} release - edit those, not this file.
class {class_name(name)} < Formula
  desc "{package["desc"]}"
  homepage "{package["homepage"]}"
  version "{version}"
  license "{package["license"]}"

{platforms}

  def install
{chr(10).join(install)}
  end

  test do
    assert_match version.to_s, shell_output("#{{bin}}/{package["bin"]} --version")
  end
end
'''


def main():
    packages = json.loads((ROOT / "packages.json").read_text(encoding="utf-8"))
    changed = []
    for package in packages:
        tag, assets = latest(package["repo"])
        formula = ROOT / "Formula" / f"{package['name']}.rb"
        text = render(package, tag, assets)
        if not formula.exists() or formula.read_text(encoding="utf-8") != text:
            formula.write_text(text, encoding="utf-8", newline="\n")
            changed.append(f"{package['name']} {tag}")
    print("updated: " + ", ".join(changed) if changed else "every formula is on its newest release")
    summary = os.environ.get("GITHUB_OUTPUT")
    if summary:
        with open(summary, "a", encoding="utf-8") as out:
            out.write(f"changed={'; '.join(changed)}\n")


if __name__ == "__main__":
    main()
