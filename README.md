# BubblesSelection SDK

Available for iOS 11+

This is the UI framework that allows developers to integrate an amazing selection interface into their applications! Each bubble has a set of parameters, which could be configured individually. The SDK was inspired by Apple Music's genre selection page.

Additionally, I uploaded here an application that demonstrates the features provided by the framework. You can press "Random" to see each bubble configured in a random way independently from others or set parameters and see how your selection page will look like.

![](https://user-images.githubusercontent.com/65894703/168443881-06c8f9c0-5f8c-42ad-9b65-4e03e6b75490.MOV)

## Configured parameters

- Bubble radius
- Bubble cover
- Bubble fill color
- Bubble title
- Bubble title color
- Bubble title size
- Bubble border width
- Bubble border color
- Selected bubble fill color
- Selected bubble radius
- Bubbles attraction force
- Background color

## Installation

### SDK

#### CocoaPods

[Official guide](https://guides.cocoapods.org/using/getting-started.html) how to install CocoaPods on your PC

[Official guide](https://guides.cocoapods.org/using/using-cocoapods.html) how to add Pods to your project

##### Short version:

Create `Podfile` (with `pod init` for example) and add `pod 'BubblesSelection'`:

```
use_frameworks!

target 'AppName' do
    pod 'BubblesSelection'
end
```

Install pods:

```
$ pod install
```

Import the module:

```
import BubblesSelection
```

#### Swift Package Manager

[Apple tutorial](https://developer.apple.com/documentation/swift_packages/adding_package_dependencies_to_your_app)

1. In your Xcode project, select File > Add Packages 
2. Enter `https://github.com/AJIJIi/Bubbles-selection` as a Git URL
3. Then choose exact version (should be 0.0.4)
4. Press `Add Package`

### Example App

Example on how to add and interact with BubblesSelection is located in the BubblesVC

#### How to run

1. Download code from this repository
2. Add this `BubblesSelection` to the project `BubblesSelection Example/BubblesSelection Example.xcodeproj` via CocoaPods or Swift Package Manager following the tutorial above
3. Run the project on the simulator or real device

## Ideas for improvement

- A feature to choose where from bubbles appear
- Make available for iPad

## Contact me

If you have any feedback, ideas for improvement or even requests, please don't hesitate to contact me here:

- bochkov.alexej@gmail.com 
- [Telegram](https://t.me/bochkov_alexej)
- [LinkedIn](https://www.linkedin.com/in/bochkov-alexej/)
