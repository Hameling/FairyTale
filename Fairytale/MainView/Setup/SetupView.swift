//
//  SetupView.swift
//  Fairytale
//
//  Created by 백승한 on 21/11/2018.
//  Copyright © 2018 WunGim. All rights reserved.
//

import UIKit
import BetterSegmentedControl

class SetupView: UIViewController {
    @IBOutlet weak var mainlang_seg: BetterSegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func testdismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
