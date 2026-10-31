cask 'sable' do
  version '2.2.3'
  sha256 '96802740ae46c140f844c4dc186a9c7ae5779b6c0e28a926d4767b3555030893'

  url "https://git.sable.moe/SableClient/sable-next/releases/download/v#{version}/sable-#{version}-arm64.dmg"
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
