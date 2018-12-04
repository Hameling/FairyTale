//
//  LanguageSelectView.swift
//  Fairytale
//
//  Created by 백승한 on 04/11/2018.
//  Copyright © 2018 WunGim. All rights reserved.
//

import UIKit

class LanguageSelectView: UIViewController {
    @IBOutlet weak var BGView: UIView!
    let mode = ["kor","rus","jap"]
    @IBAction func MainLangSegue(_ segmentControl: UISegmentedControl) {
        defaults.set(mode[segmentControl.selectedSegmentIndex], forKey: "mainLang")
        NotificationCenter.default.post(name: Notification.Name(rawValue: "ReloadTable"), object: nil)
    }
    @IBAction func SubLangSegue(_ segmentControl: UISegmentedControl) {
        defaults.set(mode[segmentControl.selectedSegmentIndex], forKey: "subLang")
        NotificationCenter.default.post(name: Notification.Name(rawValue: "ReloadTable"), object: nil)
    }
    @IBOutlet weak var MainLangSeg: UISegmentedControl!
    @IBOutlet weak var SubLangSeg: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BGView.backgroundColor = UIColor.white.withAlphaComponent(0.9)
        switch defaults.string(forKey: "mainLang")!{
        case "kor":
            MainLangSeg.selectedSegmentIndex = 0
        case "rus":
            MainLangSeg.selectedSegmentIndex = 1
        case "jap":
            MainLangSeg.selectedSegmentIndex = 2
        default:
            break;
        }
        switch defaults.string(forKey: "subLang")!{
        case "kor":
            SubLangSeg.selectedSegmentIndex = 0
        case "rus":
            SubLangSeg.selectedSegmentIndex = 1
        case "jap":
            SubLangSeg.selectedSegmentIndex = 2
        default:
            break;
        }
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print(defaults.string(forKey: "mainLang")!)
    }
}
