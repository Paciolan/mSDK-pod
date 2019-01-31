require 'json'

# Returns the version number for a package.json file
pkg_version = lambda do |dir_from_root = '', version = 'version'|
  path = File.join(__dir__, dir_from_root, 'package.json')
  JSON.parse(File.read(path))[version]
end

# Let the main package.json decide the version number for the pod
sdkapp_version = pkg_version.call('../')
# Use the same RN version that the JS tools use
react_native_version = pkg_version.call('../node_modules/react-native')

Pod::Spec.new do |s|
  s.name             = 'SdkApp'
  s.version          = sdkapp_version
  s.summary          = 'mSDK Pod Component'
  s.description      = 'This pod allows us to install the react native mSDK application into a native app.'
  s.homepage         = 'https://gitlabdev.paciolan.info/development/application/integration/mobile/msdk-pod.git'
  s.license          = { type: 'No License' }
  s.author           = { 'Daniel Escobedo' => 'descobedo@paciolan.com' }
  s.source           = { git: 'https://gitlab+deploy-token-4:hKoiyi55BUhu-SZTxGs5@gitlabdev.paciolan.info/development/application/integration/mobile/msdk-pod.git', tag: s.version.to_s }

  s.source_files   = 'Pod/Classes/**/*.{h,m}'
  s.resources      = 'Pod/Assets/{SdkApp.js,assets}'
  s.platform       = :ios, '9.0'

  # React is split into a set of subspecs, these are the essentials
  s.dependency 'React/Core', react_native_version
  s.dependency 'React/CxxBridge', react_native_version
  s.dependency 'React/RCTAnimation', react_native_version
  s.dependency 'React/RCTImage', react_native_version
  s.dependency 'React/RCTLinkingIOS', react_native_version
  s.dependency 'React/RCTNetwork', react_native_version
  s.dependency 'React/RCTText', react_native_version

  # React's Dependencies
  s.dependency 'yoga', "#{react_native_version}.React"
  react_podspecs = [
    '../node_modules/react-native/third-party-podspecs/DoubleConversion.podspec',
    '../node_modules/react-native/third-party-podspecs/Folly.podspec',
    '../node_modules/react-native/third-party-podspecs/glog.podspec'
  ]

  # Native Dependencies
  dep_podspecs = []

  # Ties the exact versions so host apps don't need to guess the version
  # or have a potential mismatch
  podspecs = react_podspecs + dep_podspecs
  podspecs.each do |podspec_path|
    spec = Pod::Specification.from_file podspec_path
    s.dependency spec.name, "#{spec.version}"
  end
end
