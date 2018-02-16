Pod::Spec.new do |s|

  s.name         = "ScrollableDatepicker"
  s.version      = "4.0.0"
  s.summary      = "Yet another datepicker for iOS"
  s.homepage     = "https://github.com/noxt/ScrollableDatepicker"
  s.screenshots  = "https://github.com/noxt/ScrollableDatepicker/blob/master/Screenshots/screen.png?raw=true"
  s.license      = "MIT"
  s.author       = { "Dmitry Ivanenko" => "id.noxt@gmail.com" }
  s.platform     = :ios, "10.0"
  s.source       = { :git => "https://github.com/noxt/ScrollableDatepicker.git", :tag => "#{s.version}" }
  s.source_files = "Sources"
  s.resource_bundles = { "ScrollableDatepicker" => ["Sources/*.xib"] }
  s.requires_arc = true

  s.ios.deployment_target = '10.0'
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.0' }

end
