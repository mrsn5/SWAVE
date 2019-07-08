platform :ios, '9.0'
use_frameworks!
inhibit_all_warnings!

target 'SWAVE' do
  pod 'Firebase/Core'
  pod 'Firebase/Auth'
  pod 'Firebase/Firestore'
  pod 'Firebase/Storage'

  pod 'MessageKit'
  post_install do |installer|
      installer.pods_project.targets.each do |target|
          if target.name == 'MessageKit'
              target.build_configurations.each do |config|
                  config.build_settings['SWIFT_VERSION'] = '4.2'
              end
          end
      end
  end

end
