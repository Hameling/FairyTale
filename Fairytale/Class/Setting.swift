//
//  Setting.swift
//  Fairytale
//
//  Created by window on 2018. 10. 14..
//  Copyright © 2018년 WunGim. All rights reserved.
//

import UIKit
//전역 변수로서 UserDefalut 재정의
let defaults = UserDefaults.standard
class Setting{
    init(){
        if defaults.object(forKey: "FontSize") == nil{
            defaults.set(20.0, forKey: "FontSize")
        }
        if defaults.object(forKey: "mainLang") == nil{
            defaults.set("kor", forKey: "mainLang")
        }
        if defaults.object(forKey: "subLang") == nil{
            defaults.set("rus", forKey: "subLang")
        }
        if defaults.object(forKey: "ScreenLockStat") == nil{
            defaults.set(false, forKey: "ScreenLockStat")
        }
    }
}
