//
//  StringExtension.swift
//  Fairytale
//
//  Created by 백승한 on 26/11/2018.
//  Copyright © 2018 WunGim. All rights reserved.
//

import Foundation

extension String{
    var localized: String{
        return NSLocalizedString(self, comment: "")
    }
}
