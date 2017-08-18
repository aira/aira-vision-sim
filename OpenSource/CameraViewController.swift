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
    var blur = UIBlurEffect(style: UIBlurEffectStyle.light)
    var blurView = UIVisualEffectView()
    @IBAction func back(_ sender: Any) {
        self.performSegue(withIdentifier: "diseaseList", sender: nil)
    }
    @IBAction func details(_ sender: Any) {
        self.performSegue(withIdentifier: "details", sender: nil)
    }
    @IBOutlet var sliderControl: UISlider!
    @IBAction func sliderControl(_ sender: Any) {
        blurView.alpha = CGFloat(sliderControl.value)
    }
    @IBOutlet var navBar: UINavigationBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        cameraView.addCameraBackground(.back, buttonMargins: view.layoutMargins)
//        cameraView.addCameraBackground()
        blurView.effect = blur
        navBar.topItem?.title = currentDisease?.getDiseaseTitle
        diseaseTitle = (currentDisease?.getDiseaseTitle)!
        applyFilter()
    }
    func applyFilter() {
        switch diseaseTitle {
            case "Glaucoma":
                overlayView.image = UIImage(named: "Glaucoma")
                sliderControl.isHidden = true
            case "Retinal Detachment":
                overlayView.image = UIImage(named: "rd")
                sliderControl.isHidden = true
            case "Optic Neuritis(Neuropathy)":
                blurView.alpha = 0.1
                blurView.frame = cameraView.bounds
                cameraView.addSubview(blurView)
            case "Cataracts":
                blurView.alpha = 0.1
                blurView.frame = cameraView.bounds
                cameraView.addSubview(blurView)
            case "Corneal Dystrophy":
                blurView.alpha = 0.1
                blurView.frame = cameraView.bounds
                cameraView.addSubview(blurView)
            case "Neuromyelitis Optica (Devic's Disease)":
                overlayView.image = UIImage(named: "Devic")
                sliderControl.isHidden = true
            case "Retinitis Pigmentosa(RP)":
                overlayView.image = UIImage(named: "RP")
                sliderControl.isHidden = true
            case "Macular Degeneration":
                overlayView.image = UIImage(named: "macular_degen")
                blurView.frame = cameraView.bounds
                blurView.alpha = 0.1
                cameraView.addSubview(blurView)
            case "Diabetic Retinopathy":
                overlayView.image = UIImage(named: "DR")
                sliderControl.isHidden = true
            case "Leber's Congenital Amaurosis":
                blurView.frame = cameraView.bounds
                blurView.alpha = 0.1
                cameraView.addSubview(blurView)
            case "Leber Hereditary Optic Neuropathy (LHON)":
                overlayView.image = UIImage(named: "MacularDegen")
                blurView.frame = cameraView.bounds
                blurView.alpha = 0.1
                cameraView.addSubview(blurView)
            case "Stargardt Disease":
                overlayView.image = UIImage(named: "MacularDegen")
                blurView.frame = cameraView.bounds
                blurView.alpha = 0.1
                cameraView.addSubview(blurView)
            case "Optic Nerve Hypoplasia":
                blurView.frame = cameraView.bounds
                blurView.alpha = 0.1
                cameraView.addSubview(blurView)
            case "Bardet Biedle Syndrome":
                overlayView.image = UIImage(named: "RP")
                sliderControl.isHidden = true
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "details" {
            if let destination = segue.destination as? DetailsViewController {
                destination.currentDisease = currentDisease
            }
        }
    }
}
