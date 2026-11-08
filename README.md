# lacodda/tap

Homebrew formulae for the programs of the lacodda line.

```bash
brew install lacodda/tap/turnout
```

| Formula | What it is |
| --- | --- |
| [`turnout`](https://github.com/lacodda/turnout) | A developer's switchyard: point local apps at any backend stand, keep servers and secrets at hand, build and deploy from any directory. Installs `turnout` and the alias `tn`. |

Each formula installs the release's own archive for macOS on Apple silicon and Linux on x86-64 and arm64, checked against the SHA-256 written in it.

## How the formulae are kept

Nothing in `Formula/` is written by hand. `tools/update.py` reads `packages.json` and each package's newest GitHub release, hashes the archives and writes the formula; the `Update` workflow runs it every four hours and on demand, commits what changed and installs every formula on macOS and Linux to prove it. A new program joins the tap as one entry in `packages.json`.

## License

MIT (c) [Kirill Lakhtachev](https://lacodda.com)
