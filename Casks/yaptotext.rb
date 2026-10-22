cask "yaptotext" do
  version "1.5.4"
  sha256 "94472c1948a9c0e3e9775dbc5144b9a411742ffb4474ea57ae65e2d33edb2580"

  url "https://github.com/ryleighnewman/YapToText/releases/download/v#{version}-22/YapToText-#{version}.zip"
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
