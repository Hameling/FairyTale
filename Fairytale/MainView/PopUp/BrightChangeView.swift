//
//  BrightChangeView.swift
//  Fairytale
//
//  Created by 백승한 on 04/11/2018.
//  Copyright © 2018 WunGim. All rights reserved.
//

import UIKit

class BrightChangeView: UIViewController {
    
    @IBOutlet var BackgroudView: UIView!
    @IBAction func BrightCotroll(_ slider: UISlider) {
        UIScreen.main.brightness = CGFloat(slider.value)
    }
    @IBOutlet weak var Brightness_Slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BackgroudView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.9)
        let CurrentBright = UIScreen.main.brightness
        Brightness_Slider.value = Float(CurrentBright)
    }
}
