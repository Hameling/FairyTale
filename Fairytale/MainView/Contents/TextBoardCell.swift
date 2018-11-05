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

class TextBoardCell: UITableViewCell {

    @IBOutlet weak var mainLabel: ActiveLabel!
    @IBOutlet weak var subLabel: ActiveLabel!
    
    let pattens = [
        ActiveType.custom(pattern: "산신"),
        ActiveType.custom(pattern: "여우"),
        ActiveType.custom(pattern: "3개의 병")]
    
    func addText(main:String, sub:String){
        mainLabel.text = main
        subLabel.text = sub
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        for i in pattens{
            mainLabel.enabledTypes.append(i)
            mainLabel.customColor[i] = UIColor.purple
            mainLabel.customSelectedColor[i] = UIColor.gray
            mainLabel.handleCustomTap(for: i){ element in
                SCLAlertView().showInfo("키워드 이름", subTitle: "키워드 내용\n이렇습니다")
            }
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
