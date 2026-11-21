cask "fishsticks-and-custard" do
  version "0.10.0-beta.7"
  sha256 "b64e4fa67d459b1f6db9fa29b93cc5e67f514dad66b9ea2f8795896281f279ef"

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
