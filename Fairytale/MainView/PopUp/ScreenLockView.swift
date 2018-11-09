//
//  ScreenLockView.swift
//  Fairytale
//
//  Created by 백승한 on 04/11/2018.
//  Copyright © 2018 WunGim. All rights reserved.
//

import UIKit

class ScreenLockView: UIViewController {

    @IBOutlet var BackgroudView: UIView!
    @IBOutlet weak var OnOFFText: UILabel!
    var  ScreenLock = false
    override func viewDidLoad() {
        super.viewDidLoad()
        BackgroudView.backgroundColor = UIColor.white.withAlphaComponent(0.9)
        defaults.set(false, forKey: "ScreenLockStat")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if defaults.bool(forKey: "ScreenLockStat") == false{
            OnOFFText.text = "ON"
            UIApplication.shared.isIdleTimerDisabled = true
            defaults.set(!defaults.bool(forKey: "ScreenLockStat"), forKey: "ScreenLockStat")
        }
        else{
            OnOFFText.text = "OFF"
            UIApplication.shared.isIdleTimerDisabled = false
            defaults.set(!defaults.bool(forKey: "ScreenLockStat"), forKey: "ScreenLockStat")
        }
    }
}
