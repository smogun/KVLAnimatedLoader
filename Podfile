source 'https://github.com/CocoaPods/Specs.git'
use_frameworks!

platform :ios, '8.0'

pod "KVLHelpers"

post_install do |installer|
    installer.pods_project.build_configurations.each do |config|
        if config.name.include?("Debug")

            # Add DEBUG to custom configurations containing 'Debug'
            config.build_settings['OTHER_SWIFT_FLAGS'] ||= ['$(inherited)']
            if !config.build_settings['OTHER_SWIFT_FLAGS'].include? '-DDEBUG'
                config.build_settings['OTHER_SWIFT_FLAGS'] << '-DDEBUG'
            end
        end
    end
    installer.pods_project.build_configuration_list.build_configurations.each do |configuration|
        configuration.build_settings['CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES'] = 'YES'
    end
end
