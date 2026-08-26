cask "yaptotext" do
  version "1.3.1"
  sha256 "f0a011ffafd14b9e8652ec776d20305b9aa3f71f90c6786a08938b3ab5297d1c"

  url "https://github.com/ryleighnewman/YapToText/releases/download/v#{version}-11/YapToText-#{version}.zip",
      verified: "github.com/ryleighnewman/YapToText/"
  name "YapToText"
  desc "On-device dictation and speech-to-text for the Mac"
  homepage "https://github.com/ryleighnewman/YapToText"

  depends_on macos: ">= :sonoma"

  app "YapToText.app"

  # The speech and cleanup models are NOT bundled in this build (they would put the
  # download well past GitHub's 2 GB asset ceiling). The app downloads them on demand
  # from the AI Models page, and falls back to Apple's built-in speech engine until then.
  caveats <<~EOS
    On first launch, open AI Models and download a speech model for the best accuracy.
    Until you do, YapToText uses Apple's built-in speech engine.
  EOS

  zap trash: [
    "~/Library/Containers/YapToText",
    "~/Library/Application Support/YapToText",
    "~/Library/Application Support/YapToText-bundled-models",
  ]
end
