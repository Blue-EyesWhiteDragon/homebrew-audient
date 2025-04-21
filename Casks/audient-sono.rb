cask "audient-sono" do
  appliance = "Sono"
  live_search = %r{href=.*?/#{appliance}(?:%20|\s)*v?(\d+(?:\.\d+)*(?:b\d+)?)\.dmg}i
  year = 2021

  version "4.2.1"
  sha256 "71f230c09c64f660bd87c8a7262b70a30fa163f6a5329021c3378dd98c0f106b"

  url "https://d9w4fhj63j193.cloudfront.net/#{year}/#{appliance}/1.%20Drivers/#{appliance}%20v#{version}.pkg",
      verified: "d9w4fhj63j193.cloudfront.net/"
  name "Audient Sono Drivers"
  desc "CoreAudio compatible drivers for the Audient Sono range"
  homepage "https://audient.com/products/audio-interfaces/sono/overview/"

  livecheck do
    url "https://audient.com/products/audio-interfaces/#{appliance.downcase}/downloads/"
    regex(live_search)
  end

  depends_on macos: ">= :high_sierra"

  pkg "Sono v#{version}.pkg"

  uninstall \
    launchctl: "com.audient.sono.service",
    pkgutil:   [
      "com.audient.pkg.sono.app",
      "com.twonotes.pkg.remote.app",
    ],
    delete:    [
      "/Library/Application Support/Audient/#{appliance}",
      "/Library/LaunchAgents/com.audient.sono.service.plist",
    ]

  zap trash: [
    "~/Documents/Two notes Audio Engineering",
    "~/Library/Caches/com.two-notes.TorpedoRemote",
    "~/Library/HTTPStorages/com.two-notes.TorpedoRemote",
    "~/Library/Preferences/com.audient.sono.plist",
    "~/Library/Saved Application State/com.audient.sono.savedState",
  ]
end
