target 'MyIntranet' do
    use_frameworks!
    inhibit_all_warnings!
    pod 'LiferayScreens'
    pod 'LiferayScreensThemeDemo', :git => 'https://github.com/jmnavarro/liferay-screens-themes', :branch => 'master'
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.2'
            config.build_settings['CONFIGURATION_BUILD_DIR'] = '$PODS_CONFIGURATION_BUILD_DIR'
        end
    end
end
