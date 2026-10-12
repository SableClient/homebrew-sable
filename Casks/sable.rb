cask 'sable' do
  version '2.0.1'
  sha256 '67453aed30a4e63d0b07c84e5689b184b0a42e465e6ef4b1ef3ccd3dca8baed7'

  url "https://git.sable.moe/SableClient/sable-next/releases/download/v#{version}/sable-#{version}-macos-universal.dmg"
  name 'Sable'
  desc 'Client for the Matrix chat network'
  homepage 'https://sable.moe/'

  livecheck do
    url 'https://git.sable.moe/SableClient/sable-next/releases'
    regex(%r{/releases/tag/v?(\d+(?:\.\d+)+)}i)
  end

  auto_updates true
  depends_on :macos

  app 'Sable.app'

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
