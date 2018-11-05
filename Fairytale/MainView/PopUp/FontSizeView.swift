//
//  FontSizeView.swift
//  Fairytale
//
//  Created by 백승한 on 04/11/2018.
//  Copyright © 2018 WunGim. All rights reserved.
//

import UIKit

class FontSizeView: UIViewController {

    @IBOutlet var BackgroudView: UIView!
    @IBAction func FontSizeSegue(_ segmentControl: UISegmentedControl) {
        let mode = [11.0,14.0,17.0,20.0,23.0]
        defaults.set(mode[segmentControl.selectedSegmentIndex], forKey: "FontSize")
        NotificationCenter.default.post(name: Notification.Name(rawValue: "FontResize"), object: nil)
        
    }
    @IBOutlet weak var FSSegue: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        BackgroudView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.8)
        switch defaults.float(forKey: "FontSize") {
        case 11.0:
            FSSegue.selectedSegmentIndex = 0
        case 14.0:
            FSSegue.selectedSegmentIndex = 1
        case 17.0:
            FSSegue.selectedSegmentIndex = 2
        case 20.0:
            FSSegue.selectedSegmentIndex = 3
        case 23.0:
            FSSegue.selectedSegmentIndex = 4
        default:
            break
        }
    }
}
