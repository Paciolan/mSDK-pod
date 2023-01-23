require 'json'

pkg_version = lambda do |dir_from_root = '', version = 'version'|
  path = File.join(__dir__, dir_from_root, 'package.json')
  JSON.parse(File.read(path))[version]
end

paciolansdk_version = pkg_version.call('../')

Pod::Spec.new do |s|
  s.name             = 'PaciolanSDK'
  s.version          = paciolansdk_version
  s.summary          = 'Pod Component for Paciolan Mobile SDK'
  s.description      = 'This pod allows us to install the Paciolan react native SDK ViewController into an iOS app.'
  s.homepage         = 'https://github.com/Paciolan/mSDK-pod'
  s.license          = { type: 'No License' }
  s.author           = { 'Paciolan Mobile Team' => 'pacmobile@paciolan.com' }
  s.source           = { git: 'https://github.com/Paciolan/mSDK-pod.git', tag: s.version.to_s }

  s.source_files   = 'Pod/Classes/**/*.{h,m}'
  s.resources      = 'Pod/Assets/{PaciolanSDK.js,assets}'
  s.ios.resource_bundles = { 'PaciolanSDK' => ['Pod/Assets/{PaciolanSDK.js,assets}'] }
  s.platform       = :ios, '9.0'

  core = [
    '../node_modules/react-native/React.podspec',
    '../node_modules/react-native/React-Core.podspec',
    '../node_modules/react-native/React/CoreModules/React-CoreModules.podspec',
    '../node_modules/react-native/Libraries/ActionSheetIOS/React-RCTActionSheet.podspec',
    '../node_modules/react-native/Libraries/NativeAnimation/React-RCTAnimation.podspec',
    '../node_modules/react-native/Libraries/Blob/React-RCTBlob.podspec',
    '../node_modules/react-native/Libraries/Image/React-RCTImage.podspec',
    '../node_modules/react-native/Libraries/LinkingIOS/React-RCTLinking.podspec',
    '../node_modules/react-native/Libraries/Network/React-RCTNetwork.podspec',
    '../node_modules/react-native/Libraries/Settings/React-RCTSettings.podspec',
    '../node_modules/react-native/Libraries/Text/React-RCTText.podspec',
    '../node_modules/react-native/Libraries/Vibration/React-RCTVibration.podspec'
  ]

  core_dependencies = [
    '../node_modules/react-native/ReactCommon/cxxreact/React-cxxreact.podspec',
    '../node_modules/react-native/ReactCommon/jsi/React-jsi.podspec',
    '../node_modules/react-native/ReactCommon/jsiexecutor/React-jsiexecutor.podspec',
    '../node_modules/react-native/Libraries/FBReactNativeSpec/FBReactNativeSpec.podspec',
    '../node_modules/react-native/Libraries/TypeSafety/RCTTypeSafety.podspec',
    '../node_modules/react-native/ReactCommon/ReactCommon.podspec',
    '../node_modules/react-native/ReactCommon/yoga/Yoga.podspec',
  ]

  core_dependencies_dependencies = [
    '../node_modules/react-native/Libraries/RCTRequired/RCTRequired.podspec',
    '../node_modules/react-native/Libraries/FBLazyVector/FBLazyVector.podspec',
    '../node_modules/react-native/ReactCommon/jsinspector/React-jsinspector.podspec',
    '../node_modules/react-native/ReactCommon/callinvoker/React-callinvoker.podspec',
  ]

  third_party_dependencies = [
    '../node_modules/react-native/third-party-podspecs/DoubleConversion.podspec',
    '../node_modules/react-native/third-party-podspecs/Folly.podspec',
    '../node_modules/react-native/third-party-podspecs/glog.podspec'
  ]

  msdk_dependencies = [
    '../node_modules/react-native-code-push/CodePush.podspec',
    '../node_modules/react-native-i18n/RNI18N.podspec',
    '../node_modules/react-native-awesome-card-io/RNAwesomeCardIO.podspec',
    '../node_modules/react-native-svg/RNSVG.podspec',
    '../node_modules/react-native-haptic-feedback/RNReactNativeHapticFeedback.podspec',
    '../node_modules/@paciolan/react-native-payments/lib/ios/ReactNativePayments.podspec',
    '../node_modules/react-native-webview/react-native-webview.podspec',
    '../node_modules/react-native-device-info/RNDeviceInfo.podspec',
    '../node_modules/@react-native-community/async-storage/RNCAsyncStorage.podspec',
    '../node_modules/react-native-wallet/react-native-wallet.podspec',
    '../node_modules/react-native-select-contact/react-native-select-contact.podspec'
  ]

  podspecs = core + core_dependencies + core_dependencies_dependencies + third_party_dependencies + msdk_dependencies

  podspecs.each do |podspec_path|
    spec = Pod::Specification.from_file podspec_path
      s.dependency spec.name, "#{spec.version}"
  end
end
