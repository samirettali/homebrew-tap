cask "sottovoce" do
  version "0.1.0"
  sha256 "1227c07cc91ca294f6feaf0b85336f522a7f064febce77fe8ecf1df8deac7d30"

  url "https://github.com/samirettali/sottovoce/releases/download/v#{version}/Sottovoce-#{version}.dmg"
  name "Sottovoce"
  desc "Minimal macOS menu bar dictation"
  homepage "https://github.com/samirettali/sottovoce"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

  app "Sottovoce.app"

  # Only the preferences. The Parakeet models under
  # ~/Library/Application Support/FluidAudio are deliberately left alone: that
  # cache is shared with every other FluidAudio app (Hex, Spokenly, Voice Ink),
  # so zapping it would delete ~470 MB belonging to something else. API keys
  # live in the Keychain and casks have no primitive to remove them.
  zap trash: "~/Library/Preferences/dev.samir.sottovoce.plist"
end
