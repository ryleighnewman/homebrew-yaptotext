cask "yaptotext" do
  version "1.5.3"
  sha256 "b0894eae1e28d01356bb58ea6e707af497f6ee4a435b0d8005c9ff3dad2ea640"

  url "https://github.com/ryleighnewman/YapToText/releases/download/v#{version}-21/YapToText-#{version}.zip",
      verified: "github.com/ryleighnewman/YapToText/"
  name "YapToText"
  desc "On-device dictation and speech-to-text for the Mac"
  homepage "https://yaptotext.com"

  depends_on macos: :sonoma

  app "YapToText.app"

  # The speech and cleanup models are NOT bundled in this build (they would put the
  # download well past GitHub's 2 GB asset ceiling). The app downloads them on demand
  # from the AI Models page; dictation is unavailable until a speech model is installed.
  caveats <<~EOS
    On first launch, open AI Models and download a speech model. Dictation starts
    working as soon as one is installed.
  EOS

  zap trash: [
    "~/Library/Containers/YapToText",
    "~/Library/Application Support/YapToText",
    "~/Library/Application Support/YapToText-bundled-models",
  ]
end
