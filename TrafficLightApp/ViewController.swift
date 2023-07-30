//
//  ViewController.swift
//  TrafficLightApp
//
//  Created by OSIIOSdev on 18.07.2023.
//

import UIKit

class ViewController: UIViewController {
    enum Lights {
        case red
        case yellow
        case green
    }
    
    // MARK: - @IBOutlets
    @IBOutlet var redLightView: UIView!
    @IBOutlet var yellowLightView: UIView!
    @IBOutlet var greenLightView: UIView!
    
    @IBOutlet var ButtonLightChanged: UIButton!
    
    // MARK: - Properties
    private var currentLight = Lights.red
    
    private var lightOn: CGFloat = 1
    private var lighOff: CGFloat = 0.3
    
    // MARK: - AppLifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setButtonConfig()
        
        setLightConfig(for: redLightView, color: .systemRed)
        setLightConfig(for: yellowLightView, color: .systemYellow)
        setLightConfig(for: greenLightView, color: .systemGreen)
    }
    
    override func viewWillLayoutSubviews() {
        redLightView.layer.cornerRadius = redLightView.frame.width / 2
        yellowLightView.layer.cornerRadius = yellowLightView.frame.width / 2
        greenLightView.layer.cornerRadius = greenLightView.frame.width / 2
    }

    // MARK: - UIElementsSettingsMethods
    private func setLightConfig(for light: UIView, color: UIColor) {
        light.backgroundColor = color
        light.alpha = lighOff
    }
    
    private func setButtonConfig() {
        ButtonLightChanged.layer.cornerRadius = 15
        ButtonLightChanged.setTitle("START", for: .normal)
        ButtonLightChanged.tintColor = UIColor.black
        ButtonLightChanged.backgroundColor = UIColor.white
    }
    
    // MARK: - @IBActionMethods
    @IBAction func getButtonPressedAction(_ sender: UIButton) {
        sender.setTitle("NEXT", for: .normal)
        
        switch currentLight {
        case .red:
            greenLightView.alpha = lighOff
            redLightView.alpha = lightOn
            currentLight = .yellow
        case .yellow:
            redLightView.alpha = lighOff
            yellowLightView.alpha = lightOn
            currentLight = .green
        case .green:
            yellowLightView.alpha = lighOff
            greenLightView.alpha = lightOn
            currentLight = .red
        }
    }
    
    
}

