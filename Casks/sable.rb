cask 'sable' do
  version '2.3.6'
  sha256 'dc0aeba3fe427eda190a2b93e3fdca795cdf7d44a78229379681308c16d149a2'

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
