# homebrew-tap

Homebrew tap for my macOS apps.

```sh
brew tap samirettali/tap
brew trust samirettali/tap
brew install --cask samirettali/tap/sottovoce
```

Recent Homebrew ignores casks from third-party taps until they are trusted, so
the `brew trust` step is required — without it the install fails with the tap
listed as untrusted. Use `brew trust --cask samirettali/tap/sottovoce` instead
to trust that one cask rather than everything this tap ships, now and in
future.

## Casks

| Cask | Description |
| --- | --- |
| [`sottovoce`](https://github.com/samirettali/sottovoce) | Minimal macOS menu bar dictation |

Uninstalling leaves two things behind that a cask can't clean up: the API keys
in the Keychain, and the Microphone and Accessibility grants in System
Settings → Privacy & Security.
