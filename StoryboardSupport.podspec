#
# Be sure to run `pod spec lint StoryboardSupport.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# To learn more about the attributes see http://docs.cocoapods.org/specification.html
#
Pod::Spec.new do |s|
  s.name         = "StoryboardSupport"
  s.version      = "0.0.1"
  s.summary      = "Utilities to make prototyping with Storyboards easier, created for designers."
  s.description  = <<-DESC
                    Utilities include:
                    Sound effects
                    Setting custom fonts from Storyboards
                    Basic navigation methods, accessible from the Storyboard (e.g. dismissing modal views)
                    Toggling between contained view controllers, directly from the Storyboard.
                   DESC
  s.homepage     = "https://github.com/MaxGabriel/StoryboardSupport"
  # s.screenshots  = "www.example.com/screenshots_1", "www.example.com/screenshots_2"

  s.license      = 'MIT'
  s.author       = { "Maximilian Tagher" => "feedback.tagher@gmail.com" }
  s.source       = { :git => "https://github.com/MaxGabriel/StoryboardSupport.git", :tag => "0.0.2" }
  s.platform     = :ios, '5.0' # Correct minimum platform?

  # A list of file patterns which select the source files that should be
  # added to the Pods project. If the pattern is a directory then the
  # path will automatically have '*.{h,m,mm,c,cpp}' appended.
  #
  s.source_files = 'StoryboardSupport/Classes', 'StoryboardSupport/Classes/**/*.{h,m}'

  # A list of file patterns which select the header files that should be
  # made available to the application. If the pattern is a directory then the
  # path will automatically have '*.h' appended.
  #
  # If you do not explicitly set the list of public header files,
  # all headers of source_files will be made public.
  #
  # s.public_header_files = 'Classes/**/*.h'

  s.frameworks = 'AudioToolbox', 'QuartzCore'
  s.requires_arc = true

  # Finally, specify any Pods that this Pod depends on.
  #
  # s.dependency 'JSONKit', '~> 1.4'
end
