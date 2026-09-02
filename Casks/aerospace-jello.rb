cask "aerospace-jello" do
  version "0.21.3-jello.16"
  sha256 "e13fe95fea36921056df703e114e7a55f1b11ef695cbb9c9bf13bc2ab229fe98"

  url "https://github.com/ManofJELLO/AeroSpace_Jello/releases/download/v#{version}/AeroSpace-v#{version}.zip"
  name "AeroSpace (Jello fork)"
  desc "Tiling window manager that preserves layout across native fullscreen"
  homepage "https://github.com/ManofJELLO/AeroSpace_Jello"

  conflicts_with cask: "aerospace"
  depends_on macos: :ventura

  app "AeroSpace-v#{version}/AeroSpace.app"
  binary "AeroSpace-v#{version}/bin/aerospace"

  postflight do
    system_command "/usr/bin/xattr",
                   args:         ["-dr", "com.apple.quarantine", "#{appdir}/AeroSpace.app"],
                   must_succeed: false
    system_command "/usr/bin/xattr",
                   args:         ["-dr", "com.apple.quarantine",
                                  "#{staged_path}/AeroSpace-v#{version}/bin/aerospace"],
                   must_succeed: false
  end

  zap trash: [
    "~/Library/Caches/bobko.aerospace",
    "~/Library/HTTPStorages/bobko.aerospace",
    "~/Library/Preferences/bobko.aerospace.plist",
    "~/Library/Saved Application State/bobko.aerospace.savedState",
  ]
end
