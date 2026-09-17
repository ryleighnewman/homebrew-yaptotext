cask "yaptotext" do
  version "1.5.2"
  sha256 "6dee8b5c298b73090d459ff4fe2d557439750f6751d857fc0a4ff935066d35f1"

  url "https://github.com/ryleighnewman/YapToText/releases/download/v#{version}-18/YapToText-#{version}.zip",
      verified: "github.com/ryleighnewman/YapToText/"
  name "YapToText"
  desc "On-device dictation and speech-to-text for the Mac"
  homepage "https://yaptotext.com"

  depends_on macos: :sonoma

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
