#
# Be sure to run `pod lib lint iOSCoreFramework.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'iOSCoreFramework'
  s.version          = '0.1.1'
  s.summary          = 'This is short summary of iOSCoreFramework.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'This is description for custom cocoapods, we can use it using following ways'

  s.homepage         = 'https://github.com/priyanka7293/iOSCoreFramework'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'priyanka7293' => 'priyanka.tuplondhe@triarqhealth.com' }
  s.source           = { :git => 'https://github.com/priyanka7293/iOSCoreFramework.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'iOSCoreFramework/Classes/**/*'
  s.swift_version = '4.2'
  # s.resource_bundles = {
  #   'iOSCoreFramework' => ['iOSCoreFramework/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
