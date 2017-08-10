//
//  ViewController.swift
//  OpenSource
//
//  Created by Haasith Sanka on 8/1/17.
//  Copyright © 2017 Haasith Sanka. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet var tableView: UITableView!
    var diseaseArr = ["Glaucoma", "Retinal Detachment", "Optic Neuritis(Neuropathy)", "Leber's Congenital Amaurosis", "LHON", "Stargardt Disease", "Optic Nerve Hypoplasia", "Cataracts", "Diabetic Retinopathy", "Macular Degeneration", "Corneal Dystrophy", "Retinitis Pigmentosa(RP)", "Bardet Biedle Syndrome", "Neuromyelitis Optica (Devic's Disease)"]
    var diseaseTitle = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "disease")!
        cell.textLabel?.text = diseaseArr[indexPath.row]
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return diseaseArr.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        diseaseTitle = (cell?.textLabel?.text)!
        tableView.deselectRow(at: indexPath, animated: true)
        self.performSegue(withIdentifier: "cameraView", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "cameraView" {
            if let destination = segue.destination as? CameraViewController {
                destination.diseaseTitle = diseaseTitle
            }
        }
    }
    


}

