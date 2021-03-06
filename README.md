# Aira Vision Simulator

[![Swift Version][swift-image]][swift-url]
[![License][license-image]][license-url]
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](http://makeapullrequest.com)
[![Itunes App Store](https://img.shields.io/itunes/v/1276859786.svg)](https://itunes.apple.com/us/app/aira-vision-sim/id1276859786?mt=8)

Aira vision simulator helps people understand what kind of blindnesses exist. It simulates the blindness using the camera, so you can get a feel for how blind people see. We also provide details about each disease.

Here's more about us and our mission https://aira.io/

## Usage

Use the Disease model to add new diseases.

* Name of disease (title)
* Description (description)
* Areas of the eye affected (areasAffected)
* Inherited or not (inherited)
* Sources for the information (sources)
* Core Aspects of the disease (keyFacts)

```swift
init(title:String, description:String, areasAffected:String, people:String, inherited:Bool, sources:String, keyFacts:String) {}
```


## Requirements

- iOS 8.0+
- Xcode 8.0+

## Installation

Download the repository and click run.

## License

Copyright 2017 Aira Tech Corp.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.


[swift-image]:https://img.shields.io/badge/swift-3.0-orange.svg
[swift-url]: https://swift.org/
[license-image]: https://img.shields.io/badge/License-Apache%202.0-blue.svg
[license-url]: LICENSE
