cask "audient_id" do
  on_el_capitan :or_older do
    version "3.2.0"
    sha256 "b39fc04f144c5305d73fc6ae626d5b3bfb5e79e00550f90c49c554e514dcf477"

    url "https://d9w4fhj63j193.cloudfront.net/2021/Legacy%20Drivers/iD%20Legacy%20Drivers%20Mac/iD%20v#{version}.dmg",
        verified: "d9w4fhj63j193.cloudfront.net/"

    livecheck do
      skip "Legacy Version"
    end
  end
  on_sierra do
    version "4.04"
    sha256 "a0e476b3bf10b827f1b38a4fffacbcca1873cd979f3b89d4f630356d283d1baf"

    url "https://d9w4fhj63j193.cloudfront.net/2021/Legacy%20Drivers/iD%20Legacy%20Drivers%20Mac/iD%20v#{version}.dmg",
        verified: "d9w4fhj63j193.cloudfront.net/"

    livecheck do
      skip "Legacy Version"
    end
  end
  on_high_sierra :or_newer do
    version "4.4.0b1"
    sha256 "cb213a35c84d63ca5fda01e3f944447ae2e95ee1efb8de8c0efcf44b84bc2bce"

    url "https://d9w4fhj63j193.cloudfront.net/2024/iD%20Drivers/iD%20v#{version}.dmg",
        verified: "d9w4fhj63j193.cloudfront.net/"

    livecheck do
      url "https://audient.com/products/audio-interfaces/id4/downloads/"
      regex(%r{href=.*?/iD.*(\d+(?:\.\d+)*)\.dmg}i)
    end
  end

  name "Audient ID Drivers"
  desc "CoreAudio compatible drivers for the Audient ID range, including MKII"
  homepage "https://audient.com/id-audio-interface-range/"

  depends_on macos: ">= :el_capitan"

  app "iD.app"

  zap trash: [
    "~/Library/Application Support/Audient",
    "~/Library/Preferences/com.audient.id.plist",
    "~/Library/Saved Application State/com.audient.id.savedState",
  ]
end
