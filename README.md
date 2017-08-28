# Aira

[![Swift Version][swift-image]][swift-url]
[![License][license-image]][license-url]
[![Build](https://img.shields.io/travis/USER/REPO.svg)]
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

## Features

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


## Requirements

- iOS 8.0+
- Xcode 8.0+

## Installation

## Meta


[swift-image]:https://img.shields.io/badge/swift-3.0-orange.svg
[swift-url]: https://swift.org/
[license-image]: https://img.shields.io/badge/License-MIT-blue.svg
[license-url]: LICENSE.txt
[build-image]: https://img.shields.io/travis/USER/REPO.svg
