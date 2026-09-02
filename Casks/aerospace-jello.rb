cask "aerospace-jello" do
  version "0.21.3-jello.13"
  sha256 "5026b9ff95b8bfc172e562f1a02507dcd3f40a4c10436797606346465ef8e08d"

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
