
//
//  SelectingView.swift
//  Fairytale
//
//  Created by 백승한 on 04/11/2018.
//  Copyright © 2018 WunGim. All rights reserved.
//

import UIKit

var selectedSection = 0
var selectedItem = 0

class SelectingView: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var SelectView: UICollectionView!
    let Subject_Info = Subject()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SelectView.backgroundColor =  UIColor(white: 1, alpha: 0)
        //SelectView.backgroundColor = UIColor(patternImage: UIImage(named:"backgroud.png")!)
        self.SelectView.dataSource = self
        self.SelectView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //Fade In 구현
        UIView.animate(withDuration: 1, animations: {
            self.SelectView.alpha = 1.0
        })
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Subject_Info.subject_list.count
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if let sectionHeader = SelectView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SCSection", for: indexPath) as? SelectViewSection{
            sectionHeader.SectionName.text = Subject_Info.subject_list[indexPath.section]
            return sectionHeader
        }
        return UICollectionReusableView()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Subject_Info.book_list[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.SelectView.dequeueReusableCell(withReuseIdentifier: "Collection_cell", for: indexPath) as! BookCollectionCell
        cell.CollectionImage.image = Subject_Info.logo_image[indexPath.section][indexPath.row]
        //cell.CollectionName.text = Subject_Info.book_list[indexPath.section][indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedSection = indexPath.section
        selectedItem = indexPath.row
        performSegue(withIdentifier: "showDetail", sender: self)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        let totalCellWidth = 171 * collectionView.numberOfItems(inSection: section)
        let totalSpacingWidth = 10 * (collectionView.numberOfItems(inSection: section) - 1)
        
        let leftInset = (collectionView.frame.width - CGFloat(totalCellWidth + totalSpacingWidth)) / 2
        let rightInset = leftInset
        
        return UIEdgeInsets(top: 0, left: leftInset, bottom: 0, right: rightInset)
    }
    
}
