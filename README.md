# homebrew-tap

Homebrew tap for my macOS apps.

```sh
brew install --cask samirettali/tap/sottovoce
```

Homebrew taps this repository on its own, so there's no separate `brew tap`
step.

## Casks

| Cask | Description |
| --- | --- |
| [`sottovoce`](https://github.com/samirettali/sottovoce) | Minimal macOS menu bar dictation |

Uninstalling leaves two things behind that a cask can't clean up: the API keys
in the Keychain, and the Microphone and Accessibility grants in System
Settings → Privacy & Security.
