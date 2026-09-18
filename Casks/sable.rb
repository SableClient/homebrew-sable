# Generated from packaging/homebrew/sable.rb in SableClient/Sable. Edit it there.
cask 'sable' do
  version "1.22.4"
  sha256 "735a67fd243c801a84f1637475fcbbe345a9e4f5ffeee2ffe2ee2378aca514b8"

  url "https://github.com/SableClient/Sable/releases/download/v#{version}/Sable-#{version}-macos-universal.dmg"
  name 'Sable'
  desc 'Client for the Matrix chat network'
  homepage 'https://sable.moe/'

  livecheck do
    url :url
    strategy :github_latest
  end

  # The app updates itself through tauri-plugin-updater.
  auto_updates true
  depends_on :macos

  app 'Sable.app'

  # The DMG is neither signed nor notarized, so Gatekeeper would refuse to open
  # it. Drop the quarantine flag the download picked up.
  postflight_steps do
    on_macos do
      run '/usr/bin/xattr', args: ['-dr', 'com.apple.quarantine', '{{appdir}}/Sable.app']
    end
  end

  uninstall quit: 'moe.sable.client'

  zap trash: [
    '~/Library/Application Support/moe.sable.client',
    '~/Library/Caches/moe.sable.client',
    '~/Library/HTTPStorages/moe.sable.client',
    '~/Library/Preferences/moe.sable.client.plist',
    '~/Library/Saved Application State/moe.sable.client.savedState',
    '~/Library/WebKit/moe.sable.client'
  ]
end
