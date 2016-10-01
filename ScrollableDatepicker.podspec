#
#  Be sure to run `pod spec lint ScrollableDatepicker.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  s.name         = "ScrollableDatepicker"
  s.version      = "1.0.0"
  s.summary      = "Yet another datepicker for iOS"
  s.homepage     = "https://github.com/noxt/ScrollableDatepicker"
  s.screenshots  = "https://github.com/noxt/ScrollableDatepicker/blob/master/Screenshots/screen.png?raw=true"
  s.license      = "MIT"
  s.author             = { "Dmitry Ivanenko" => "id.noxt@gmail.com" }
  s.platform     = :ios, "9.0"

  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the location from where the source should be retrieved.
  #  Supports git, hg, bzr, svn and HTTP.
  #

  s.source       = { :git => "https://github.com/noxt/ScrollableDatepicker.git", :tag => "#{s.version}" }
  s.source_files  = "Sources"
  s.requires_arc = true

end
