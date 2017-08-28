//
//  DetailsViewController.swift
//  OpenSource
//
//  Created by Haasith Sanka on 8/3/17.
//  Copyright © 2017 Haasith Sanka. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet var navBar: UINavigationBar!
    @IBOutlet var descriptionText: UILabel!
    @IBOutlet var areasAffected: UILabel!
    @IBOutlet var peopleAffectedText: UILabel!
    @IBOutlet var inheritedText: UILabel!
    @IBOutlet var sourcesText: UILabel!
    var currentDisease:Disease?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = currentDisease?.getDiseaseTitle
        descriptionText.text = currentDisease?.getDescriptionText
        areasAffected.text = currentDisease?.getAreasAffectedText
        peopleAffectedText.text = currentDisease?.getPeopleText
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
