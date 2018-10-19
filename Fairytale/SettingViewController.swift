//
//  SettingViewController.swift
//  Fairytale
//
//  Created by window on 2018. 10. 14..
//  Copyright © 2018년 WunGim. All rights reserved.
//

import UIKit
import ActiveLabel

class SettingViewController: UIViewController {
   
     override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ReturnButton(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
}
