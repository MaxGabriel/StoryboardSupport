#StoryboardSupport


Installation
-------------

###Cocoapods

[Cocoapods](http://cocoapods.org/) is the recommended installation method. By using Cocoapods, you can automatically get updates to StoryboardSupport.

1. Install CocoaPods. From the Terminal:
```sh
gem install cocoapods
pod setup
```
If the first command fails, you may need to do `sudo gem install cocoapods`

2. In Terminal, navigate to the directory where your Xcode Project is, make a file with no extension named `Podfile`
```sh
touch Podfile
```

3. Copy this into the Podfile:
```ruby
platform :ios, '5.0'
pod 'StoryboardSupport'
```

3. Close your Xcode Project, if it's open.
4. Run `pod install`
5. Henceforth, open the `.xcworkspace` file.

###Drag-n-Drop

Download the project. Open the `StoryboardSupport` folder. Drag the contents of the `Classes` folder into your project.