Pod::Spec.new do |s|
  s.name         = "yanOptionBarController"
  s.version      = "0.0.1"
  s.summary      = "OptionBarController for iOS"
  s.description  = "OptionBarController is iPad and iPhone compatible. Supports landscape and portrait orientations and can be used inside UITabbarController."
  s.homepage     = "https://github.com/yans67/yanOptionBarController"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "yans67" => "yans67@163.com" }
  s.platform     = :ios
  s.source       = { :git => "https://github.com/yans67/yanOptionBarController.git", :tag => s.version.to_s }
  s.source_files  = 'yanOptionBarController', 'yanOptionBarController/classes/Ctrl/*.{h,m}'
  s.requires_arc = true
end
