require 'json'

# Returns the version number for a package.json file
pkg_version = lambda do |dir_from_root = '', version = 'version'|
  path = File.join(__dir__, dir_from_root, 'package.json')
  JSON.parse(File.read(path))[version]
end

# Let the main package.json decide the version number for the pod
paciolansdk_version = pkg_version.call('../')
# Use the same RN version that the JS tools use
react_native_version = pkg_version.call('../node_modules/react-native')

# Flurry version
flurry_sdk_version = '9.3.1'

Pod::Spec.new do |s|
  s.name             = 'PaciolanSDK'
  s.version          = paciolansdk_version
  s.summary          = 'Pod Component for Paciolan Mobile SDK'
  s.description      = 'This pod allows us to install the Paciolan react native SDK ViewController into an iOS app.'
  s.homepage         = 'https://gitlabdev.paciolan.info/development/application/integration/mobile/msdk-pod.git'
  s.license          = { type: 'No License' }
  s.author           = { 'Paciolan Mobile Team' => 'pacmobile@paciolan.com' }
  s.source           = { git: 'https://gitlab+deploy-token-4:hKoiyi55BUhu-SZTxGs5@gitlabdev.paciolan.info/development/application/integration/mobile/msdk-pod.git', tag: s.version.to_s }

  s.source_files   = 'Pod/Classes/**/*.{h,m}'
  s.resources      = 'Pod/Assets/{PaciolanSDK.js,assets}'
  s.platform       = :ios, '9.0'

  # React is split into a set of subspecs, these are the essentials
  s.dependency 'React/Core', react_native_version
  s.dependency 'React/CxxBridge', react_native_version
  s.dependency 'React/RCTActionSheet', react_native_version
  s.dependency 'React/RCTAnimation', react_native_version
  s.dependency 'React/RCTImage', react_native_version
  s.dependency 'React/RCTLinkingIOS', react_native_version
  s.dependency 'React/RCTNetwork', react_native_version
  s.dependency 'React/RCTText', react_native_version


  s.dependency 'Flurry-iOS-SDK/FlurrySDK', flurry_sdk_version
  s.dependency 'Flurry-iOS-SDK/FlurryMessaging', flurry_sdk_version
  s.dependency 'Flurry-iOS-SDK/FlurryConfig', flurry_sdk_version

  # React's Dependencies
  s.dependency 'yoga', "#{react_native_version}.React"
  react_podspecs = [
    '../node_modules/react-native/third-party-podspecs/DoubleConversion.podspec',
    '../node_modules/react-native/third-party-podspecs/Folly.podspec',
    '../node_modules/react-native/third-party-podspecs/glog.podspec'
  ]

  # Native Dependencies
  dep_podspecs = [
    # CodePush
    '../node_modules/react-native-code-push/CodePush.podspec',
    # ReactNativeI18N
    '../node_modules/react-native-i18n/RNI18N.podspec',
    # ReactNativeAwesomeCardIO
    '../node_modules/react-native-awesome-card-io/RNAwesomeCardIO.podspec',
    # React Native SVG
    '../node_modules/react-native-svg/RNSVG.podspec',
    # React Native Flurry
    '../node_modules/react-native-flurry-sdk/react-native-flurry-sdk.podspec',
    # React Native Haptic Feedback
    '../node_modules/react-native-haptic-feedback/react-native-haptic-feedback.podspec'
  ]

  # Ties the exact versions so host apps don't need to guess the version
  # or have a potential mismatch
  podspecs = react_podspecs + dep_podspecs
  podspecs.each do |podspec_path|
    spec = Pod::Specification.from_file podspec_path
    s.dependency spec.name, "#{spec.version}"
  end
end
