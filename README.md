# Aira Vision Simulator

[![Swift Version][swift-image]][swift-url]
[![License][license-image]][license-url]
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

Aira vision simulator helps people understand what kind of blindnesses exist. It simulates the blindness using the camera, so you can get a feel for for how blind people see. We also provide details about each disease.

Here's more about us and our mission https://aira.io/

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

Download the repository and click run.

##License 

Copyright 2017 Aira Tech Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

##Creator

Haasith Sanka
https://github.com/Hsanka6


[swift-image]:https://img.shields.io/badge/swift-3.0-orange.svg
[swift-url]: https://swift.org/
[license-image]: https://img.shields.io/badge/License-MIT-blue.svg
[license-url]: LICENSE.txt
