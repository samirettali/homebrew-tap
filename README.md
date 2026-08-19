# homebrew-tap

Homebrew tap for my macOS apps.

```sh
brew tap samirettali/tap
brew trust samirettali/tap
brew install --cask samirettali/tap/<cask>
```

Recent Homebrew ignores casks from third-party taps until they are trusted, so
the `brew trust` step is required — without it the install fails with the tap
listed as untrusted. Use `brew trust --cask samirettali/tap/<cask>` instead to
trust that one cask rather than everything this tap ships, now and in future.

## Casks

| Cask | Description |
| --- | --- |
| [`sottovoce`](https://github.com/samirettali/sottovoce) | Minimal macOS menu bar dictation |
| [`pulse`](https://github.com/samirettali/pulse) | Menu bar live prices and clocks |
| [`sottomano`](https://github.com/samirettali/sottomano) | Launcher driven by one leader key |

All are Apple Silicon only and need macOS 14 or later.

## Formulae

| Formula | Description |
| --- | --- |
| [`herdr`](https://github.com/samirettali/herdr) | My patched fork of the terminal workspace manager |

```sh
brew install samirettali/tap/herdr
```

`herdr` also exists in homebrew-core, and two taps cannot own the same name at
once, so uninstall that one first. The formula builds from source at a pinned
revision of the `patched` branch: bump the revision here after pushing to the
fork.

Uninstalling `sottovoce` leaves two things behind that a cask can't clean up:
the API keys in the Keychain, and the Microphone and Accessibility grants in
System Settings → Privacy & Security. `pulse` keeps everything in
`~/.config/pulse`, which `brew uninstall --zap` removes.
