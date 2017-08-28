//
// CameraViewController.swift
//
// Copyright 2017 Aira Tech Inc.
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
    @IBAction func SegmentedControl(_ sender: Any) {
        switch diseaseTitle {
            case "Glaucoma":
                switch segmentedControl.selectedSegmentIndex
                {
                case 0:
                    overlayView.image = UIImage(named: "glaucoma_early")
                case 1:
                    overlayView.image = UIImage(named: "glaucoma_middle")
                case 2:
                    overlayView.image = UIImage(named: "glaucoma_late")
                default:
                    overlayView.image = UIImage(named: "glaucoma_early")
                }
            case "Macular Degeneration":
                switch segmentedControl.selectedSegmentIndex
                {
                    case 0:
                        overlayView.image = UIImage(named: "mac_early")
                    case 1:
                        overlayView.image = UIImage(named: "mac_middle")
                    case 2:
                        overlayView.image = UIImage(named: "mac_late")
                    default:
                        overlayView.image = UIImage(named: "mac_early")
                        break
                }
            case "Retinal Detachment":
                switch segmentedControl.selectedSegmentIndex
                {
                    case 0:
                        overlayView.image = UIImage(named: "rd")
                    case 1:
                        overlayView.image = UIImage(named: "retinal_detachment1")
                    case 2:
                        overlayView.image = UIImage(named: "retinal_detachment2")
                    default:
                        overlayView.image = UIImage(named: "rd")
                        break
                }
            case "Stargardt Disease":
                switch segmentedControl.selectedSegmentIndex
                {
                case 0:
                    overlayView.image = UIImage(named: "mac_early")
                case 1:
                    overlayView.image = UIImage(named: "mac_middle")
                case 2:
                    overlayView.image = UIImage(named: "mac_late")
                default:
                    overlayView.image = UIImage(named: "mac_early")
                    break
                }
            
            case "Leber Hereditary Optic Neuropathy (LHON)":
                switch segmentedControl.selectedSegmentIndex
                {
                    case 0:
                        overlayView.image = UIImage(named: "mac_early")
                    case 1:
                        overlayView.image = UIImage(named: "mac_middle")
                    case 2:
                        overlayView.image = UIImage(named: "mac_late")
                    default:
                        overlayView.image = UIImage(named: "mac_early")
                    break
                }
            case "Diabetic Retinopathy":
                switch segmentedControl.selectedSegmentIndex
                {
                case 0:
                    overlayView.image = UIImage(named: "DR")
                case 1:
                    overlayView.image = UIImage(named: "rd2")
                default:
                    overlayView.image = UIImage(named: "DR")
                    break
                }
            case "Retinitis Pigmentosa(RP)":
                switch segmentedControl.selectedSegmentIndex
                {
                case 0:
                    overlayView.image = UIImage(named: "glaucoma_early")
                case 1:
                    overlayView.image = UIImage(named: "glaucoma_middle")
                case 2:
                    overlayView.image = UIImage(named: "glaucoma_late")
                default:
                    overlayView.image = UIImage(named: "glaucoma_early")
                }
            case "Bardet Biedle Syndrome":
                switch segmentedControl.selectedSegmentIndex
                {
                case 0:
                    overlayView.image = UIImage(named: "glaucoma_early")
                case 1:
                    overlayView.image = UIImage(named: "glaucoma_middle")
                case 2:
                    overlayView.image = UIImage(named: "glaucoma_late")
                default:
                    overlayView.image = UIImage(named: "glaucoma_early")
                }
            default:
                break;
        }
        
    }
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBAction func sliderControl(_ sender: Any) {
        blurView.alpha = CGFloat(sliderControl.value)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        cameraView.addCameraBackground(.back, buttonMargins: view.layoutMargins)
//        cameraView.addCameraBackground()
        blurView.effect = blur
        //navBar.topItem?.title = currentDisease?.getDiseaseTitle
        if currentDisease?.getDiseaseTitle == "Leber Hereditary Optic Neuropathy (LHON)" {
            self.title = "LHON"
        } else if currentDisease?.getDiseaseTitle == "Neuromyelitis Optica (Devic's Disease)" {
            self.title = "Devic's Disease"
        } else {
            self.title = currentDisease?.getDiseaseTitle
        }
        cameraView.removeCameraControls()
        segmentedControl.tintColor = hexStringToUIColor(hex: "#21BECE")
        segmentedControl.backgroundColor = UIColor.white
        segmentedControl.layer.cornerRadius = 5
        diseaseTitle = (currentDisease?.getDiseaseTitle)!
        applyFilter()
    }
    func applyFilter() {
        switch diseaseTitle {
            case "Glaucoma":
                print(diseaseTitle)
                overlayView.image = UIImage(named: "glaucoma_early")
                sliderControl.isHidden = true
            case "Retinal Detachment":
                overlayView.image = UIImage(named: "rd")
                sliderControl.isHidden = true
                segmentedControl.setTitle("Ex 1", forSegmentAt: 0)
                segmentedControl.setTitle("Ex 2", forSegmentAt: 1)
                segmentedControl.setTitle("Ex 3", forSegmentAt: 2)
            case "Optic Neuritis(Neuropathy)":
                blurView.alpha = 0.5
                blurView.frame = cameraView.bounds
                cameraView.addSubview(blurView)
                segmentedControl.isHidden = true
            case "Cataracts":
                blurView.alpha = 0.5
                blurView.frame = cameraView.bounds
                cameraView.addSubview(blurView)
                segmentedControl.isHidden = true
            case "Corneal Dystrophy":
                blurView.alpha = 0.5
                blurView.frame = cameraView.bounds
                cameraView.addSubview(blurView)
                segmentedControl.isHidden = true
            case "Neuromyelitis Optica (Devic's Disease)":
                overlayView.image = UIImage(named: "Devic")
                sliderControl.isHidden = true
            case "Retinitis Pigmentosa(RP)":
                overlayView.image = UIImage(named: "glaucoma_early")
                sliderControl.isHidden = true
            case "Macular Degeneration":
                overlayView.image = UIImage(named: "mac_early")
                blurView.frame = cameraView.bounds
                blurView.alpha = 0.5
                cameraView.addSubview(blurView)
                sliderControl.isHidden = true
            case "Diabetic Retinopathy":
                overlayView.image = UIImage(named: "DR")
                sliderControl.isHidden = true
                segmentedControl.removeSegment(at: 2, animated: false)
                segmentedControl.setTitle("Ex 1", forSegmentAt: 0)
                segmentedControl.setTitle("Ex 2", forSegmentAt: 1)
            case "Leber's Congenital Amaurosis":
                blurView.frame = cameraView.bounds
                blurView.alpha = 0.5
                cameraView.addSubview(blurView)
                segmentedControl.isHidden = true
            case "Leber Hereditary Optic Neuropathy (LHON)":
                overlayView.image = UIImage(named: "mac_early")
                blurView.frame = cameraView.bounds
                blurView.alpha = 0.5
                cameraView.addSubview(blurView)
                sliderControl.isHidden = true
            case "Stargardt Disease":
                overlayView.image = UIImage(named: "mac_early")
                blurView.frame = cameraView.bounds
                blurView.alpha = 0.5
                cameraView.addSubview(blurView)
                sliderControl.isHidden = true
            case "Optic Nerve Hypoplasia":
                blurView.frame = cameraView.bounds
                blurView.alpha = 0.5
                cameraView.addSubview(blurView)
                segmentedControl.isHidden = true
            case "Bardet Biedle Syndrome":
                overlayView.image = UIImage(named: "glaucoma_early")
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

extension UIViewController {
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.characters.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
