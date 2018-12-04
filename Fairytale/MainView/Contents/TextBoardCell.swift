//
//  TextBoardCell.swift
//  Fairytale
//
//  Created by 백승한 on 28/10/2018.
//  Copyright © 2018 WunGim. All rights reserved.
//

import UIKit
import ActiveLabel
import SCLAlertView

class CustomLabel : ActiveLabel{
    
}
var pattens :[ActiveType] = []
var kwds :[Keyword] = []
class TextBoardCell: UITableViewCell {

    @IBOutlet weak var mainLabel: CustomLabel!
    @IBOutlet weak var subLabel: CustomLabel!
    
    func addText(main:String, sub:String){
        mainLabel.text = main
        subLabel.text = sub
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        mainLabel.backgroundColor = UIColor(white: 1, alpha: 0)
        subLabel.backgroundColor = UIColor(white: 1, alpha: 0)
        for i in 0..<pattens.count{
            mainLabel.enabledTypes.append(pattens[i])
            mainLabel.customColor[pattens[i]] = UIColor.orange
            mainLabel.customSelectedColor[pattens[i]] = UIColor.gray
            mainLabel.handleCustomTap(for: pattens[i]){ element in
                SCLAlertView().showInfo(kwds[i].keyword_name, subTitle: self.setSubTitle("main", index: i) + "\n" + self.setSubTitle("sub", index: i),colorStyle: 0xF9690E)
            }
            
            subLabel.enabledTypes.append(pattens[i])
            subLabel.customColor[pattens[i]] = UIColor.orange
            subLabel.customSelectedColor[pattens[i]] = UIColor.gray
            subLabel.handleCustomTap(for: pattens[i]){ element in
                SCLAlertView().showInfo(kwds[i].keyword_name, subTitle: self.setSubTitle("sub", index: i) + "\n" + self.setSubTitle("main", index: i),colorStyle: 0xF9690E)
            }
            
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func setSubTitle(_ type:String, index:Int)->String{
        var keyname : String
        var result = ""
        if type == "main"{
            keyname = "mainLang"
        }
        else if type == "sub"{
            keyname = "subLang"
        }
        else {
            keyname = " "
        }
        
        switch defaults.string(forKey: keyname)!{
        case "kor":
            result = kwds[index].keyword_contents
        case "rus":
            result = kwds[index].russia_contents
        case "jap":
            result = kwds[index].japan_contents
        default:
            break;
        }

        return result
    }
}
