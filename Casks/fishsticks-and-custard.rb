cask "fishsticks-and-custard" do
  version "0.10.0-beta.5"
  sha256 "daf1680f75745393f4ed1f74021db6d9d2184b84d8f13f74ba31c46eb5dd6f0b"

  url "https://github.com/ManofJELLO/fishsticks-and-custard/releases/download/v#{version}/FishsticksAndCustard-#{version}.zip"
  name "Fishsticks & Custard"
  desc "Voice assistant in the menu bar for Claude, Codex, Antigravity or OpenCode"
  homepage "https://github.com/ManofJELLO/fishsticks-and-custard"

  depends_on macos: :ventura
  depends_on arch: :arm64

  app "FishsticksAndCustard.app"
  binary "#{appdir}/FishsticksAndCustard.app/Contents/MacOS/fsc"

  # Signed ad hoc, not by a developer ID: without this, Gatekeeper won't
  # open it.
  postflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "{{appdir}}/FishsticksAndCustard.app"],
        must_succeed: false
  end

  # `brew uninstall --zap` also removes settings, memory, models and the log.
  zap trash: "~/Library/Application Support/fsc"
end
