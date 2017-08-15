//
//  CameraViewController.swift
//  OpenSource
//
//  Created by Haasith Sanka on 8/1/17.
//  Copyright © 2017 Haasith Sanka. All rights reserved.
//

struct AppUtility {
    static func lockOrientation(_ orientation: UIInterfaceOrientationMask) {
        if let delegate = UIApplication.shared.delegate as? AppDelegate {
            delegate.orientationLock = orientation
        }
    }
    /// OPTIONAL Added method to adjust lock and rotate to the desired orientation
    static func lockOrientation(_ orientation: UIInterfaceOrientationMask, andRotateTo rotateOrientation:UIInterfaceOrientation) {
        self.lockOrientation(orientation)
        UIDevice.current.setValue(rotateOrientation.rawValue, forKey: "orientation")
    }
}


import UIKit
import CameraBackground
class CameraViewController: UIViewController {
    @IBOutlet var overlayView: UIImageView!
    @IBOutlet var cameraView: UIView!
    var diseaseTitle:String = ""
    var currentDisease:Disease?
    
    @IBAction func back(_ sender: Any) {
        self.performSegue(withIdentifier: "diseaseList", sender: nil)
    }
    @IBAction func details(_ sender: Any) {
        self.performSegue(withIdentifier: "details", sender: nil)
    }
    
    @IBOutlet var navBar: UINavigationBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        cameraView.addCameraBackground(.back, buttonMargins: view.layoutMargins)
//        cameraView.addCameraBackground()
        applyFilter()
        navBar.topItem?.title = diseaseTitle
    }
    func applyFilter() {
        switch diseaseTitle {
            case "Glaucoma":
                overlayView.image = UIImage(named: "Glaucoma")
            case "Retinal Detachment":
                overlayView.image = UIImage(named: "rd")
            case "Optic Neuritis(Neuropathy)":
                let blur = UIBlurEffect(style: UIBlurEffectStyle.light)
                let blurView = UIVisualEffectView(effect: blur)
                blurView.frame = cameraView.bounds
                cameraView.addSubview(blurView)
            case "Optic nerve hypoplasia":
                let blur = UIBlurEffect(style: UIBlurEffectStyle.light)
                let blurView = UIVisualEffectView(effect: blur)
                blurView.frame = cameraView.bounds
                cameraView.addSubview(blurView)
            case "Cataracts":
                let blur = UIBlurEffect(style: UIBlurEffectStyle.light)
                let blurView = UIVisualEffectView(effect: blur)
                blurView.frame = cameraView.bounds
                cameraView.addSubview(blurView)
            case "Corneal Dystrophy":
                let blur = UIBlurEffect(style: UIBlurEffectStyle.light)
                let blurView = UIVisualEffectView(effect: blur)
                blurView.frame = cameraView.bounds
                cameraView.addSubview(blurView)
            case "Neuromyelitis Optica (Devic's Disease)":
                overlayView.image = UIImage(named: "Devic")
            case "Retinitis Pigmentosa(RP)":
                overlayView.image = UIImage(named: "RP")
            case "Macular Degeneration":
                overlayView.image = UIImage(named: "MacularDegen")
                let blur = UIBlurEffect(style: UIBlurEffectStyle.light)
                let blurView = UIVisualEffectView(effect: blur)
                blurView.frame = cameraView.bounds
                blurView.alpha = 0.5
                cameraView.addSubview(blurView)
            case "Diabetic Retinopathy":
                overlayView.image = UIImage(named: "DR")
            case "Leber's Congenital Amaurosis":
                let blur = UIBlurEffect(style: UIBlurEffectStyle.light)
                let blurView = UIVisualEffectView(effect: blur)
                blurView.frame = cameraView.bounds
                blurView.alpha = 0.7
                cameraView.addSubview(blurView)
            case "LHON":
                overlayView.image = UIImage(named: "MacularDegen")
                let blur = UIBlurEffect(style: UIBlurEffectStyle.light)
                let blurView = UIVisualEffectView(effect: blur)
                blurView.frame = cameraView.bounds
                blurView.alpha = 0.5
                cameraView.addSubview(blurView)
            case "Stargardt Disease":
                overlayView.image = UIImage(named: "MacularDegen")
                let blur = UIBlurEffect(style: UIBlurEffectStyle.light)
                let blurView = UIVisualEffectView(effect: blur)
                blurView.frame = cameraView.bounds
                blurView.alpha = 0.5
                cameraView.addSubview(blurView)
            case "Optic Nerve Hypoplasia":
                let blur = UIBlurEffect(style: UIBlurEffectStyle.light)
                let blurView = UIVisualEffectView(effect: blur)
                blurView.frame = cameraView.bounds
                blurView.alpha = 0.5
                cameraView.addSubview(blurView)
            case "Bardet Biedle Syndrome":
                overlayView.image = UIImage(named: "RP")
            default:
                print("None")
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        AppUtility.lockOrientation(.portrait)
        // Or to rotate and lock
        // AppUtility.lockOrientation(.portrait, andRotateTo: .portrait)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Don't forget to reset when view is being removed
        AppUtility.lockOrientation(.all)
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "details" {
            if let destination = segue.destination as? DetailsViewController {
                destination.currentDisease = currentDisease
            }
        }
    }
    

}
