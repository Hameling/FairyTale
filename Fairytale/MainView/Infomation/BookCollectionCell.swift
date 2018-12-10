//
//  BookCollectionCell.swift
//  Fairytale
//
//  Created by 백승한 on 04/11/2018.
//  Copyright © 2018 WunGim. All rights reserved.
//

import UIKit


class SelectViewSection: UICollectionReusableView{
    @IBOutlet weak var SectionName: UILabel!
    
}

class BookCollectionCell: UICollectionViewCell {
    @IBOutlet weak var CollectionImage: UIImageView!
    @IBOutlet weak var CollectionLabel: UILabel!
}
