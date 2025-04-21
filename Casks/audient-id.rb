cask "audient-id" do
  appliance = "iD"
  live_search = %r{href=.*?/#{appliance}(?:%20|\s)*v?(\d+(?:\.\d+)*(?:b\d+)?)\.dmg}i
  on_el_capitan :or_older do
    year = 2021

    version "3.2.0"
    sha256 "b39fc04f144c5305d73fc6ae626d5b3bfb5e79e00550f90c49c554e514dcf477"

    url "https://d9w4fhj63j193.cloudfront.net/#{year}/Legacy%20Drivers/#{appliance}%20Legacy%20Drivers%20Mac/#{appliance}%20v#{version}.dmg",
        verified: "d9w4fhj63j193.cloudfront.net/"

    livecheck do
      skip "Legacy Version"
    end
  end
  on_sierra do
    year = 2021

    version "4.04"
    sha256 "a0e476b3bf10b827f1b38a4fffacbcca1873cd979f3b89d4f630356d283d1baf"

    url "https://d9w4fhj63j193.cloudfront.net/#{year}/Legacy%20Drivers/#{appliance}%20Legacy%20Drivers%20Mac/#{appliance}%20v#{version}.dmg",
        verified: "d9w4fhj63j193.cloudfront.net/"

    livecheck do
      skip "Legacy Version"
    end
  end
  on_high_sierra :or_newer do
    year = 2025
    driver_parent = "#{appliance}48"

    version "4.4.2b6"
    sha256 "cd21b2e0aaaf8511307550255a1c4e67308f0480a42778995ed2546847818dfc"

    url "https://d9w4fhj63j193.cloudfront.net/#{year}/#{driver_parent}/Drivers/#{appliance}%20v#{version}.dmg",
        verified: "d9w4fhj63j193.cloudfront.net/"

    livecheck do
      url "https://audient.com/products/audio-interfaces/id4/downloads/"
      regex(live_search)
    end
  end

  name "Audient ID Drivers"
  desc "CoreAudio compatible drivers for the Audient ID range, including MKII"
  homepage "https://audient.com/id-audio-interface-range/"

  depends_on macos: ">= :el_capitan"

  app "#{appliance}.app"

  uninstall delete: "/Library/Application Support/Audient/#{appliance}"

  zap trash: [
    "~/Library/Logs/com.audient.iD",
    "~/Library/Preferences/com.audient.id.plist",
    "~/Library/Saved Application State/com.audient.id.savedState",
  ]
end
