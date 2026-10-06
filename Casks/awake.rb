# frozen_string_literal: true

cask "awake" do
  version "1.2.1"
  sha256 "d0ccd7b6287b8f6c9831b59f95577f6b734884b430444092316c8a15c6410834"

  url "https://github.com/mackhaymond/Awake/releases/download/v#{version}/Awake-v#{version}.zip"
  name "Awake"
  desc "Menu-bar app that shows who is keeping the machine awake"
  homepage "https://github.com/mackhaymond/Awake"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Awake.app"

  zap trash: "~/Library/Preferences/com.mackhaymond.Awake.plist"

  caveats <<~EOS
    Awake is ad-hoc signed (not notarized), so Gatekeeper blocks the first
    launch. Right-click Awake.app -> Open once, or run:

      xattr -dr com.apple.quarantine /Applications/Awake.app
  EOS
end
