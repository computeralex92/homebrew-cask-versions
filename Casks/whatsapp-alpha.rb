cask "whatsapp-alpha" do
  version "2.23.7.82"
  sha256 "2f0f7603c1352934fc8995cf76921163c9f9264a03151374eb95ed9b2aa42fd0"

  url "https://web.whatsapp.com/desktop/mac_native/release/?version=#{version}&extension=zip&configuration=Beta&branch=relbranch"
  name "WhatsApp Alpha"
  desc "Native desktop client for WhatsApp"
  homepage "https://faq.whatsapp.com/451924530376167/?cms_platform=web"

  livecheck do
    url "https://web.whatsapp.com/desktop/mac_native/updates/?branch=relbranch&configuration=Beta"
    strategy :sparkle do |item|
      item["url"][/\?version=v?(\d+(?:\.\d+)+)[ "&]/i, 1]
    end
  end

  auto_updates true
  conflicts_with cask: [
    "whatsapp",
    "whatsapp-beta",
  ]
  depends_on macos: ">= :big_sur"

  app "WhatsApp.app"

  zap trash: [
    "~/Library/Application Support/WhatsApp",
    "~/Library/Application Support/WhatsApp.ShipIt",
    "~/Library/Caches/WhatsApp",
    "~/Library/Caches/WhatsApp.ShipIt",
    "~/Library/Preferences/ByHost/WhatsApp.ShipIt.*.plist",
    "~/Library/Preferences/WhatsApp.plist",
    "~/Library/Preferences/WhatsApp-Helper.plist",
    "~/Library/Saved Application State/WhatsApp.savedState",
  ]
end
