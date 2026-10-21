cask 'sable' do
  version '2.1.0'
  sha256 '3b45a8e61ef0c82aaa19cd3c9cf7395b7c858875ceedb2170ee589f50e4c5610'

  url "https://git.sable.moe/SableClient/sable-next/releases/download/v#{version}/sable-electron-#{version}-arm64.dmg"
  name 'Sable'
  desc 'Client for the Matrix chat network'
  homepage 'https://sable.moe/'

  livecheck do
    url 'https://git.sable.moe/SableClient/sable-next/releases'
    regex(%r{/releases/tag/v?(\d+(?:\.\d+)+)}i)
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on :macos

  app 'Sable.app'

  uninstall quit: 'moe.sable.client'

  zap trash: [
    '~/Library/Application Support/moe.sable.client',
    '~/Library/Application Support/moe.sable.client.electron',
    '~/Library/Caches/moe.sable.client',
    '~/Library/HTTPStorages/moe.sable.client',
    '~/Library/Preferences/moe.sable.client.plist',
    '~/Library/Saved Application State/moe.sable.client.savedState',
    '~/Library/WebKit/moe.sable.client'
  ]
end
