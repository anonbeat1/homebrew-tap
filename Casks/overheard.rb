cask "overheard" do
  version "0.3.2"
  sha256 "5336cdacf0d19aff99facdab640d07b9873bc3e350ad6f6df04ea71f3e2a52cb"

  url "https://github.com/anonbeat1/overheard/releases/download/v#{version}/Overheard-#{version}.dmg"
  name "Overheard"
  desc "Menu bar meeting recorder with transcripts you can query from Claude"
  homepage "https://getoverheard.dev/"

  livecheck do
    url "https://getoverheard.dev/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Overheard.app"

  # ~/Meetings holds the user's recordings and is never removed
  zap trash: [
    "~/Library/Application Support/Overheard",
    "~/Library/Caches/com.anonbeat.overheard",
    "~/Library/HTTPStorages/com.anonbeat.overheard",
    "~/Library/Preferences/com.anonbeat.overheard.plist",
  ]
end
