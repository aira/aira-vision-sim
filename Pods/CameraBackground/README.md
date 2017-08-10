# UIView+CameraBackground
Show camera layer as a background to any UIView.

## Features
* Both **front and back** camera supported.
* **Flash** modes: auto, on, off.
* Countdown **timer**.
* Tap to **focus**.
* Pinch to **zoom**.

<p align="center">
<img src="screenshots/focus.png"> &nbsp; <img src="screenshots/countdown.png">
</p>

## Usage

```swift
view.addCameraBackground()
// ...
view.takeCameraSnapshot( {
      // animate snapshot capture
      self.view.alpha = 0
      UIView.animate(withDuration: 1) { self.view.alpha = 1 }
  },
  completion: { (capturedImage, error) -> () in
      self.view.freeCameraSnapshot() // unfreeze image
      // ... handle capturedImage and error
  }
)
// ...
view.removeCameraBackground()
```

**Important:** Remeber to add `NSCameraUsageDescription` to your `Info.plist`.

## Installation

### CocoaPods:

```ruby
pod 'CameraBackground'
```

For legacy Swift 2.3:

```ruby
pod 'CameraBackground', '~> 1.0.2'
```

### Manually:

Copy `Sources/*` to your Xcode project.
