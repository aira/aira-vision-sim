//
// DetailsViewController.swift
//
// Copyright 2017 Aira Tech Corp.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import UIKit
import Crashlytics

class DetailsViewController: UIViewController {
    @IBOutlet var descriptionText: UILabel!
    @IBOutlet var peopleAffectedText: UILabel!
    @IBOutlet var inheritedText: UILabel!
    @IBOutlet var sourcesText: UILabel!
    @IBOutlet var keyFactsText: UILabel!
    @IBOutlet var areasAffectedText: UILabel!
    var currentDisease: Disease?
    override func viewDidLoad() {
        super.viewDidLoad()
        if currentDisease?.getDiseaseTitle == "Leber Hereditary Optic Neuropathy (LHON)" {
            self.title = "LHON"
        } else if currentDisease?.getDiseaseTitle == "Neuromyelitis Optica (Devic's Disease)" {
            self.title = "Devic's Disease"
        } else {
            self.title = currentDisease?.getDiseaseTitle
        }
        descriptionText.text = currentDisease?.getDescriptionText
        areasAffectedText.text = currentDisease?.getAreasAffectedText
        peopleAffectedText.text = currentDisease?.getPeopleText
        keyFactsText.text = currentDisease?.getKeyFacts
        if currentDisease?.getInheritedBool == false {
            inheritedText.text = "No"
        } else {
            inheritedText.text = "Yes"
        }
        sourcesText.text = "Sources: " + (currentDisease?.getSourcesText)!
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "camView" {
            if let destination = segue.destination as? CameraViewController {
                destination.currentDisease = currentDisease
            }
        }
    }
}
