# Uncomment this line to define a global platform for your project
platform :ios, '8.0'

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '2.3'
      config.build_settings['MACOSX_DEPLOYMENT_TARGET'] = '10.10'
    end
  end
end

target 'rxswift-examples' do
  use_frameworks!

  # Pods for rxswift-examples
  pod 'RxSwift','2.6.0'
  pod 'RxCocoa', '2.6.0'


  target 'rxswift-examplesTests' do
    inherit! :search_paths
    # Pods for testing
    pod 'Quick', '0.8.0'
    pod 'Nimble', '3.0.0'
    pod 'RxBlocking', '2.6.0'
  end

end

