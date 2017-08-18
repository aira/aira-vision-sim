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
        navBar.topItem?.title = currentDisease?.getDiseaseTitle
        // Do any additional setup after loading the view.
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
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "camView" {
            if let destination = segue.destination as? CameraViewController {
                destination.currentDisease = currentDisease
            }
        }
    }
}
