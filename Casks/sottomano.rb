cask "sottomano" do
  version "0.2.0"
  sha256 "4361739ca6fb098acaa5ed6240e7c038ad3de57ae98d5eaa46463cbb8c80c0eb"

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
    "~/.cache/sottomano",
    "~/.config/sottomano",
  ]
end
