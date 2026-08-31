cask "sottovoce" do
  version "0.3.0"
  sha256 "fbde7ed30541c0ee98eaacbb4cad0f1b1c7fe305c0f28f4eacb2e3cd0d625d2e"

  url "https://github.com/samirettali/sottovoce/releases/download/v#{version}/Sottovoce-#{version}.dmg"
  name "Sottovoce"
  desc "Minimal menu bar dictation"
  homepage "https://github.com/samirettali/sottovoce"

  livecheck do
    url :url
    strategy :github_latest
  end

  # The DMG carries an arm64-only binary, and the on-device transcription runs
  # on the Neural Engine, which Intel Macs don't have. Without this an Intel
  # user installs it and gets an app that simply won't launch.
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Sottovoce.app"

  # Only the preferences. The Parakeet models under
  # ~/Library/Application Support/FluidAudio are deliberately left alone: that
  # cache is shared with every other FluidAudio app (Hex, Spokenly, Voice Ink),
  # so zapping it would delete ~470 MB belonging to something else. API keys
  # live in the Keychain and casks have no primitive to remove them.
  # Both bundle ids: 0.1.0 shipped as dev.samir.sottovoce before the switch to
  # the domain-backed com.samirettali.sottovoce.
  zap trash: [
    "~/Library/Preferences/com.samirettali.sottovoce.plist",
    "~/Library/Preferences/dev.samir.sottovoce.plist",
  ]
end
