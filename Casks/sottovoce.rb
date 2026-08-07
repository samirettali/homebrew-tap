cask "sottovoce" do
  version "0.2.0"
  sha256 "ad34824869980316bfee0cac2e2347663f8e61e535efbf9148dd8091b6f6d256"

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
