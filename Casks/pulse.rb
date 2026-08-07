cask "pulse" do
  version "0.6.0"
  sha256 "149585d27630ff0e37d6a1ca15ca2cb84dcb8b39f9f17d80c383f60301c7a2aa"

  url "https://github.com/samirettali/pulse/releases/download/v#{version}/Pulse-#{version}.dmg"
  name "Pulse"
  desc "Menu bar live prices and clocks"
  homepage "https://github.com/samirettali/pulse"

  livecheck do
    url :url
    strategy :github_latest
  end

  # The DMG carries an arm64-only binary: it is built on Apple Silicon, and
  # LSMinimumSystemVersion allows macOS 14, which still runs on Intel. Without
  # this an Intel user installs an app that cannot launch.
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Pulse.app"

  # Everything Pulse keeps lives in one YAML file — no UserDefaults, no
  # Keychain item, so there is no plist to remove.
  zap trash: "~/.config/pulse"
end
