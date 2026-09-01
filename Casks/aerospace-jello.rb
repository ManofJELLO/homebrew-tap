cask "aerospace-jello" do
  version "0.21.3-jello.2"
  sha256 "458b7460e0c0bf74317628c613f6fd6434d953c1bcc155998530511753d303e7"

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
