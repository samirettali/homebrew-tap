cask "sottomano" do
  version "0.1.0"
  sha256 "4218f3a8ec117b78f8cc78bff3433d8ce3fdaebfc5b7489cafdec35ba383cd02"

  url "https://github.com/samirettali/sottomano/releases/download/v#{version}/Sottomano-#{version}.dmg"
  name "Sottomano"
  desc "Launcher driven by one leader key"
  homepage "https://github.com/samirettali/sottomano"

  livecheck do
    url :url
    strategy :github_latest
  end

  # The DMG carries an arm64-only binary while LSMinimumSystemVersion still
  # allows macOS versions that ran on Intel; without this an Intel user installs
  # an app that cannot launch.
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Sottomano.app"

  # The bindings and the clipboard history, which are the only things it writes.
  # The Accessibility grant is TCC's and casks have no primitive to withdraw one.
  zap trash: [
    "~/.config/sottomano",
    "~/.cache/sottomano",
  ]
end
