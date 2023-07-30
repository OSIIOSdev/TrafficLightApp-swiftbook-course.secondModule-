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
    @IBOutlet var RedLightView: UIView!
    @IBOutlet var YellowLightView: UIView!
    @IBOutlet var GreenLightView: UIView!
    
    @IBOutlet var ButtonLightChanged: UIButton!
    
    // MARK: - Properties
    private var currentLight = Lights.red
    
    private var lightOn: CGFloat = 1
    private var lighOff: CGFloat = 0.3
    
    // MARK: - AppLifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setButtonConfig()
        
        setLightConfig(for: RedLightView, color: .systemRed)
        setLightConfig(for: YellowLightView, color: .systemYellow)
        setLightConfig(for: GreenLightView, color: .systemGreen)
    }

    // MARK: - SettingsMethods
    private func setButtonConfig() {
        ButtonLightChanged.layer.cornerRadius = 15
        ButtonLightChanged.setTitle("START", for: .normal)
        ButtonLightChanged.tintColor = UIColor.white
        ButtonLightChanged.backgroundColor = UIColor.black
    }
    
    private func setLightConfig(for light: UIView, color: UIColor) {
        light.layer.cornerRadius = light.frame.width / 2
        light.backgroundColor = color
        light.alpha = lighOff
    }
    
    // MARK: - @IBActionMethods
    @IBAction func getButtonPressedAction(_ sender: UIButton) {
        sender.setTitle("NEXT", for: .normal)
        
        switch currentLight {
        case .red:
            GreenLightView.alpha = lighOff
            RedLightView.alpha = lightOn
            currentLight = .yellow
        case .yellow:
            RedLightView.alpha = lighOff
            YellowLightView.alpha = lightOn
            currentLight = .green
        case .green:
            YellowLightView.alpha = lighOff
            GreenLightView.alpha = lightOn
            currentLight = .red
        }
    }
    
    
}

