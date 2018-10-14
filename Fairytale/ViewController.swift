//
//  ViewController.swift
//  Fairytale
//
//  Created by window on 2018. 10. 12..
//  Copyright © 2018년 WunGim. All rights reserved.
//

import UIKit
import ActiveLabel
import SCLAlertView

class ViewController : UIViewController{

    
    override func viewDidLoad() {
         super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func SettingButton(_ sender: Any) {
       let uvc = self.storyboard?.instantiateViewController(withIdentifier: "SettingView")
        uvc?.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        
        
        self.present(uvc!,animated:true, completion:nil)
    }
    @IBAction func SlideShowButton(_ sender: Any) {
         SCLAlertView().showInfo("Important info", subTitle: "You are great")
    }
}

