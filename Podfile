platform :ios, '8.0'

target 'SVMCrashlyticsPoC' do
	pod 'Fabric'
	pod 'Crashlytics'
end

post_install do |installer|
	installer.pods_project.targets.each do |target|
		target.build_configurations.each do |config|
			config.build_settings['ENABLE_BITCODE'] = 'NO'
		end
	end
end
