cask "audient-evo" do
  appliance = "EVO"
  live_search = %r{href=.*?/#{appliance}(?:%20|\s)*v?(\d+(?:\.\d+)*(?:b\d+)?)\.dmg}i
  year = 2024

  version "4.4.0"
  sha256 "6d865d32c417e716df7bfa47258f7026948825b2f6a3bc7107f3ce4bc357d8c8"

  url "https://d9w4fhj63j193.cloudfront.net/#{year}/#{appliance}%20Drivers/#{appliance}%20v#{version}.dmg",
      verified: "d9w4fhj63j193.cloudfront.net/"
  name "Audient Evo Drivers"
  desc "CoreAudio compatible drivers for the Audient Evo range"
  homepage "https://evo.audio/"

  livecheck do
    url "https://audient.com/products/audio-interfaces/#{appliance}/downloads/"
    regex(live_search)
  end

  depends_on macos: ">= :high_sierra"

  app "#{appliance}.app"

  zap trash: [
    "~/Library/Application Support/Audient",
    "~/Library/Preferences/com.audient.evo.plist",
    "~/Library/Saved Application State/com.audient.evo.savedState",
  ]
end
