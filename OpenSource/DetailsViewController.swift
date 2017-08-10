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
    var diseaseTitle:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.topItem?.title = diseaseTitle
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
