cask "aerospace-jello" do
  version "0.21.3-jello.31"
  sha256 "f2cd25da540e75a613a1b26b19f6eb412b9d33eb64d89add5f029e2968c67cbc"

  url "https://github.com/ManofJELLO/AeroSpace_Jello/releases/download/v#{version}/AeroSpace-v#{version}.zip"
  name "AeroSpace (Jello fork)"
  desc "Tiling window manager that preserves layout across native fullscreen"
  homepage "https://github.com/ManofJELLO/AeroSpace_Jello"

  conflicts_with cask: "aerospace"
  depends_on macos: :ventura

  app "AeroSpace-v#{version}/AeroSpace.app"
  binary "AeroSpace-v#{version}/bin/aerospace"

  postflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "{{appdir}}/AeroSpace.app"],
        must_succeed: false
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine",
                       "{{staged_path}}/AeroSpace-v#{version}/bin/aerospace"],
        must_succeed: false
  end

  zap trash: [
    "~/Library/Caches/bobko.aerospace",
    "~/Library/HTTPStorages/bobko.aerospace",
    "~/Library/Preferences/bobko.aerospace.plist",
    "~/Library/Saved Application State/bobko.aerospace.savedState",
  ]
end
