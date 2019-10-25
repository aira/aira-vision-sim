//
//  UIView+CameraBackground.swift
//  Show camera input as a background to any UIView.
//
//  Created by Yonat Sharon on 11/1/15.
//  Copyright (c) 2015 Yonat Sharon. All rights reserved.
//

import AVFoundation
import UIKit
import MultiToggleButton
import MiniLayout

public extension UIView {
    // MARK: - Public Camera Interface

    /// Change the current camera background layer, e.g. when a user taps a camera on/off button.
    func toggleCameraBackground(_ position: AVCaptureDevice.Position = .unspecified, buttonMargins: UIEdgeInsets = .zero) {
        if cameraLayer != nil {
            removeCameraBackground()
        } else {
            addCameraBackground(position, buttonMargins: buttonMargins)
        }
    }
    /// Remove camera background layer
    func removeCameraBackground() {
        removeCameraControls()
        cameraLayer?.removeFromSuperlayer()
    }
    /// Add camera background layer
    func addCameraBackground(_ position: AVCaptureDevice.Position = .unspecified, buttonMargins: UIEdgeInsets = .zero) {
        if let session = AVCaptureSession.stillCameraCaptureSession(position) {
            let cameraLayer = CameraLayer(session: session)
            cameraLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
            layer.insertBackgroundLayer(cameraLayer, name: theCameraLayerName)
        } else {
            cameraLayer?.backgroundColor = UIColor.black.cgColor
        }

        //addCameraControls(buttonMargins)
    }

    /// Re-start streaming input from camera into background layer.
    func freeCameraSnapshot() {
        cameraLayer?.connection?.isEnabled = true // to unfreeze image
        cameraLayer?.session?.startRunning()
        removeFocusBox()
    }

    /// The background layer showing camera input stream.
    var cameraLayer: AVCaptureVideoPreviewLayer? {
        return layer.sublayerNamed(theCameraLayerName) as? AVCaptureVideoPreviewLayer
    }
    // MARK: - Private Camera Controls
    private var device: AVCaptureDevice? {
        return (cameraLayer?.session?.inputs.first as? AVCaptureDeviceInput)?.device
    }

//    private func addCameraControls(_ margins: UIEdgeInsets = .zero) {
//        // buttons panel
//        let panel = UIView()
//        panel.tag = thePanelViewTag
//        panel.tintColor = .white
//        addSubview(panel)
//        panel.translatesAutoresizingMaskIntoConstraints = false
//        constrain(panel, at: .top, diff: margins.top)
//        constrain(panel, at: .left, diff: margins.left)
//        constrain(panel, at: .right, diff: -margins.right)
//        // timer button
//        let timerButton = MultiToggleButton(image: bundeledCameraTemplateImage("camera-timer"), states: ["", "3s", "10s"], colors: [nil, UIColor.cameraOnColor(), UIColor.cameraOnColor(), UIColor.cameraOnColor()])
//        panel.addTaggedSubview(timerButton, tag: theTimerButtonTag, constrain: .top, .centerX, .bottom) // .bottom constraint sets panel height
//        timerButton.isHidden = true
//        // flash button
//        let flashButton = MultiToggleButton(image: bundeledCameraTemplateImage("camera-flash"), states: ["Off", "On", "Auto"], colors: [nil, UIColor.cameraOnColor()]) { (sender) -> Void in
////            self.setFlashMode(sender.currentStateIndex)
//        }
//        panel.addTaggedSubview(flashButton, tag: theFlashButtonTag, constrain: .top, .left)
//        flashButton.isHidden = true
////        updateFlashButtonState()
//        // switch camera button
////        if AVCaptureDevice.default(for: .video)?.constituentDevices.count ?? <#default value#> > 1 || UIDevice.isSimulator {
////            let cameraButton = UIButton.buttonWithImage(bundeledCameraTemplateImage("camera-switch")!, target: self, action: #selector(switchCamera(_:)))
////            panel.addTaggedSubview(cameraButton, tag: theSwitchButtonTag, constrain: .top, .right)
////            cameraButton.isHidden = true
////        }
//        // focus and zoom gestures - uses gesture subclass to make it identifiable when removing camera
//        addGestureRecognizer( CameraPinchGestureRecognizer(target: self, action: #selector(pinchToZoom(_:))) )
//        addGestureRecognizer( CameraTapGestureRecognizer(target: self, action: #selector(tapToFocus(_:))) )
//        device?.changeMonitoring(true)
//        NotificationCenter.default.addObserver(self, selector: #selector(removeFocusBox), name: NSNotification.Name.AVCaptureDeviceSubjectAreaDidChange, object: nil)
//    }
    func removeCameraControls() {
        // remove focus and zoom gestures
        gestureRecognizerOfType(CameraPinchGestureRecognizer.self)?.removeFromView()
        gestureRecognizerOfType(CameraTapGestureRecognizer.self)?.removeFromView()
        layer.sublayerNamed(theFocusLayerName)?.removeFromSuperlayer()
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.AVCaptureDeviceSubjectAreaDidChange, object: nil)

        // remove controls
        viewWithTag(thePanelViewTag)?.removeFromSuperview()
        viewWithTag(theCountdownLabelTag)?.removeFromSuperview()
    }
//    private func updateFlashButtonState() {
//        if let device = device {
//            if let flashButton = viewWithTag(theFlashButtonTag) as? MultiToggleButton {
//                if device.hasFlash {
//                    flashButton.isHidden = false
//                    flashButton.currentStateIndex = device.flashMode.rawValue
//                } else {
//                    flashButton.isHidden = true
//                }
//            }
//        }
//    }
    // MARK: - Action: Switch Front/Back Camera

    @objc func switchCamera(_ sender: UIButton) {
        // TODO: animate
        if let session = cameraLayer?.session {
            var cameraPosition = AVCaptureDevice.Position.unspecified
            if let input = session.inputs.first as? AVCaptureDeviceInput {
                cameraPosition = input.device.position
                session.removeInput(input)
            }
            session.addCameraInput(cameraPosition.opposite())
          //  updateFlashButtonState()
            removeFocusBox()
        }
    }
    // MARK: - Action: Toggle Flash Mode

//    func setFlashMode(_ rawValue: NSInteger) {
//        if let device = device {
//            if device.hasFlash {
//                if let newMode = AVCaptureDevice.FlashMode(rawValue: rawValue) {
//                    device.changeFlashMode(newMode)
//                }
//            }
//        }
//    }
    // MARK: - Action: Toggle Timer

    var timerInterval: Int {
        if let numberInTitle = (viewWithTag(theTimerButtonTag) as? UIButton)?.currentTitle?.trimmingCharacters(in: CharacterSet(charactersIn: " s")) {
            return Int(numberInTitle) ?? 0
        }
        return 0
    }
    private func performWithTimer(_ interval: Int, block: @escaping () -> Void) {
        if interval > 0 {
            let countdownLabel = CoundownLabel(seconds: interval, action: block)
            addTaggedSubview(countdownLabel, tag: theCountdownLabelTag, constrain: .centerX, .centerY)
        } else {
            block()
        }
    }
    // MARK: - Action: Pinch to Zoom
    @objc func pinchToZoom(_ sender: UIPinchGestureRecognizer) {
        var initialZoom: CGFloat = 1

        if let device = device {
            if sender.state == .began {
                initialZoom = device.videoZoomFactor
            }
            device.changeZoomFactor(sender.scale * initialZoom)
        }
    }
    // MARK: - Action: Tap to Focus

    @objc func tapToFocus(_ sender: UITapGestureRecognizer) {
        let focusPoint = sender.location(in: self)

        if let device = device {
            if !device.isFocusPointOfInterestSupported && !device.isExposurePointOfInterestSupported {
                return
            }
            let interestPoint = CGPoint(x: (focusPoint.y - bounds.minY) / bounds.height, y: 1 - (focusPoint.x - bounds.minX) / bounds.width)
            device.changeInterestPoint(interestPoint)
            showFocusBox(focusPoint)
        } else if UIDevice.isSimulator {
            showFocusBox(focusPoint)
        }
    }
    private func showFocusBox(_ center: CGPoint) {
        cameraLayer?.sublayerNamed(theFocusLayerName)?.removeFromSuperlayer()
        let focusLayer = FocusBoxLayer(center: center)
        focusLayer.name = theFocusLayerName
        cameraLayer?.addSublayer(focusLayer)
    }
    @objc func removeFocusBox() { // not private because it is a selector for AVCaptureDeviceSubjectAreaDidChangeNotification
        cameraLayer?.sublayerNamed(theFocusLayerName)?.removeFromSuperlayer()
        if let device = device {
            let interestPoint = device.isFocusPointOfInterestSupported ? device.focusPointOfInterest : device.exposurePointOfInterest
            let center = CGPoint(x: 0.5, y: 0.5)
            if !interestPoint.equalTo(center) {
                device.changeInterestPoint(center)
            }
        }
    }
}

class CameraLayer: AVCaptureVideoPreviewLayer {
    override init(session: AVCaptureSession) {
        super.init(session: session)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    override init(layer: Any) {
        super.init(layer: layer)
        setup()
    }


    private func setup() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateCameraFrameAndOrientation),
                                               name: UIDevice.orientationDidChangeNotification,
                                               object: nil)
    }

    @objc func updateCameraFrameAndOrientation() {
        guard let superlayer = superlayer else {return}
        frame = superlayer.bounds
        guard let connection = connection, connection.isVideoOrientationSupported,
            let appOrientation = AVCaptureVideoOrientation(rawValue: UIApplication.shared.statusBarOrientation.rawValue)
            else {return}
        connection.videoOrientation = appOrientation
    }
}
// MARK: - Private Constants
private let thePanelViewTag = 98765
private let theSwitchButtonTag = thePanelViewTag + 1
private let theFlashButtonTag = thePanelViewTag + 2
private let theTimerButtonTag = thePanelViewTag + 3
private let theCountdownLabelTag = thePanelViewTag + 4
private let theCameraLayerName = "camera"
private let theFocusLayerName = "focusSquare"

// MARK: - Useful Extensions

public extension UITraitEnvironment {
    func bundledCameraImage(_ named: String) -> UIImage? {
        if let image = UIImage(named: named) {
            return image
        }
        let podBundle = Bundle(for: FocusBoxLayer.self)
        if let url = podBundle.url(forResource: "CameraBackground", withExtension: "bundle") {
            return UIImage(named: named, in: Bundle(url: url), compatibleWith: traitCollection)
        }
        return nil
    }

    func bundeledCameraTemplateImage(_ named: String) -> UIImage? {
        return bundledCameraImage(named)?.withRenderingMode(.alwaysTemplate)
    }
}

extension UIDevice {
    class var isSimulator: Bool {
        return current.model.hasSuffix("Simulator")
    }
}

extension UIView {
    func gestureRecognizerOfType<T: UIGestureRecognizer>(_ type: T.Type) -> UIGestureRecognizer? {
        if let gestureRecognizers = gestureRecognizers {
            return gestureRecognizers.first(where: { (gsr) -> Bool in
                return gsr is T
            })
        }
        return nil
    }
    func addTaggedSubview(_ subview: UIView, tag: Int, constrain: NSLayoutConstraint.Attribute...) {
        subview.tag = tag
        subview.translatesAutoresizingMaskIntoConstraints = false
        addSubview(subview)
        //constrain.forEach { self.constrain(subview, at: $0) }
    }
}

extension UIGestureRecognizer {
    func removeFromView() {
        view?.removeGestureRecognizer(self)
    }
}

extension CALayer {
    func sublayerNamed(_ name: String) -> CALayer? {
        guard let sublayers = sublayers else {return nil}

        return sublayers.first { (layer) -> Bool in
            layer.name == name
        }
    }

    func insertBackgroundLayer(_ layer: CALayer, name: String? = nil) {
        layer.frame = bounds
        insertSublayer(layer, at: 0)
        if let name = name {
            layer.name = name
        }
    }
}

extension UIButton {
    class func buttonWithImage(_ image: UIImage, target: AnyObject, action: Selector) -> UIButton {
        let button = UIButton(type: .custom)
        button.setImage(image, for: UIControl.State())
        button.addTarget(target, action: action, for: .touchUpInside)
        return button
    }
}

// MARK: - Countdown Label

class CoundownLabel: UILabel {
    var remainingSeconds: Int = 0
    let action: () -> Void
    private var dispatchWorkItem: DispatchWorkItem?

    init(seconds: Int, action: @escaping () -> Void) {
        self.action = action
        remainingSeconds = seconds
        super.init(frame: .zero)

        textColor = .white
        shadowColor = UIColor.black.withAlphaComponent(0.5)
        let fontSize = min(UIScreen.main.bounds.width / 2, UIScreen.main.bounds.height / 3)
        font = .boldSystemFont(ofSize: fontSize)
        shadowOffset = CGSize(width: fontSize/30, height: fontSize/15)

        countdown()
    }

    required init?(coder: NSCoder) {
        action = {}
        super.init(coder: coder)
    }

    deinit {
        dispatchWorkItem?.cancel()
    }

    private func countdown() {
        if remainingSeconds > 0 {
            text = "\(remainingSeconds)"
            remainingSeconds -= 1
            dispatchWorkItem = DispatchWorkItem {[weak self] in self?.countdown()}
            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: dispatchWorkItem!)
        } else {
            removeFromSuperview()
            action()
        }
    }
}


// MARK: - Focus Box

class FocusBoxLayer: CAShapeLayer {
    convenience init(center: CGPoint) {
        self.init()
        path = UIBezierPath(focusBoxAround: center, big: true).cgPath
        strokeColor = UIColor.cameraOnColor().cgColor
        fillColor = UIColor.clear.cgColor
        DispatchQueue.main.async {
            self.path = UIBezierPath(focusBoxAround: center, big: false).cgPath
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.opacity = 0.5
        }
    }
    override func action(forKey event: String) -> CAAction? { // animate changes to 'path'
        switch event {
        case "path":
            let animation = CABasicAnimation(keyPath: event)
            animation.duration = CATransaction.animationDuration()
            animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
            return animation
        default:
            return super.action(forKey: event)
        }
    }
}

extension UIBezierPath {
    convenience init(focusBoxAround center: CGPoint, big: Bool = false) {
        let size: CGFloat = big ? 150 : 75
        let lineSize: CGFloat = 5
        let square = CGRect(x: center.x - size/2, y: center.y - size/2, width: size, height: size)
        self.init(rect: square)
        move(to: CGPoint(x: center.x, y: square.minY))
        addLine(to: CGPoint(x: center.x, y: square.minY + lineSize))
        move(to: CGPoint(x: center.x, y: square.maxY))
        addLine(to: CGPoint(x: center.x, y: square.maxY - lineSize))
        move(to: CGPoint(x: square.minX, y: center.y))
        addLine(to: CGPoint(x: square.minX + lineSize, y: center.y))
        move(to: CGPoint(x: square.maxX, y: center.y))
        addLine(to: CGPoint(x: square.maxX - lineSize, y: center.y))
    }
}

// MARK: - Identifiable Gesture Recognizers

class CameraTapGestureRecognizer: UITapGestureRecognizer, UIGestureRecognizerDelegate {
    override init(target: Any?, action: Selector?) {
        super.init(target: target, action: action)
        cancelsTouchesInView = false
        delegate = self
    }
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return !(touch.view is UIControl)
    }
}

private class CameraPinchGestureRecognizer: UIPinchGestureRecognizer {
}

// MARK: - Private AV Extensions

private extension UIColor {
    class func cameraOnColor() -> UIColor {
        return UIColor(red: 0.99, green: 0.79, blue: 0.19, alpha: 1)
    }
}

private extension AVCaptureSession {
    class func stillCameraCaptureSession(_ position: AVCaptureDevice.Position) -> AVCaptureSession? {
        if UIDevice.isSimulator {return nil}
        let session = AVCaptureSession()
        session.sessionPreset = AVCaptureSession.Preset.inputPriority
        session.addCameraInput(position)
        session.addOutput( AVCapturePhotoOutput() )
        session.startRunning()
        return session
    }

    func addCameraInput(_ position: AVCaptureDevice.Position) {
        guard let device = AVCaptureDevice.deviceWithPosition(position) else {return}

        do {
            let deviceInput = try AVCaptureDeviceInput(device: device)
            if canAddInput(deviceInput) { addInput(deviceInput) } else { NSLog("Can't add camera input for position \(position.rawValue)") }
        } catch {
            NSLog("Can't access camera")
        }
    }
}
private extension AVCaptureDevice.Position {
    func opposite() -> AVCaptureDevice.Position {
        switch self {
        case .front:  return .back
        case .back: return .front
        default: return self
        }
    }
}

private extension AVCaptureDevice {
    class func deviceWithPosition(_ position: AVCaptureDevice.Position) -> AVCaptureDevice? {
        return AVCaptureDevice.default(.builtInWideAngleCamera,
                                       for: .video,
                                       position: position)
    }
//    func changeFlashMode(_ mode: AVCaptureDevice.FlashMode) {
//        performWithLock {
//            self.flashMode = mode
//        }
//    }
    func changeInterestPoint(_ point: CGPoint) {
        performWithLock {
            if self.isFocusPointOfInterestSupported {
                self.focusPointOfInterest = point
                self.focusMode = .continuousAutoFocus
            }
            if self.isExposurePointOfInterestSupported {
                self.exposurePointOfInterest = point
                self.exposureMode = .continuousAutoExposure
            }
        }
    }
    func changeMonitoring(_ isOn: Bool) {
        performWithLock {
            self.isSubjectAreaChangeMonitoringEnabled = isOn
        }
    }
    func changeZoomFactor(_ zoomFactor: CGFloat) {
        let effectiveZoomFactor = min( max(zoomFactor, 1), 4)
        performWithLock {
            self.videoZoomFactor = effectiveZoomFactor
        }
    }
    func performWithLock(_ block: () -> Void) {
        do {
            try lockForConfiguration()
            block()
            unlockForConfiguration()
        } catch let error as NSError {
            NSLog("Failed to acquire AVCaptureDevice.lockForConfiguration: \(error.localizedDescription)")
        }
    }
}
