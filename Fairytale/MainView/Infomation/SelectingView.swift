
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
let contents_name = ["test1","test2"]

class SelectingView: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var SelectView: UICollectionView!
    let sections = ["초급","중급","고급"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.SelectView.dataSource = self
        self.SelectView.delegate = self
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if let sectionHeader = SelectView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SCSection", for: indexPath) as? SelectViewSection{
            sectionHeader.SectionName.text = sections[indexPath.section]
            return sectionHeader
        }
        return UICollectionReusableView()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contents_name.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = self.SelectView.dequeueReusableCell(withReuseIdentifier: "Collection_cell", for: indexPath) as! BookCollectionCell
            cell.CollectionImage.image = #imageLiteral(resourceName: "file")
            cell.CollectionName.text = contents_name[indexPath.row]
            return cell
        case 1:
            let cell = self.SelectView.dequeueReusableCell(withReuseIdentifier: "Collection_cell", for: indexPath) as! BookCollectionCell
            cell.CollectionImage.image = #imageLiteral(resourceName: "file")
            cell.CollectionName.text = contents_name[indexPath.row]
            return cell
        case 2:
            let cell = self.SelectView.dequeueReusableCell(withReuseIdentifier: "Collection_cell", for: indexPath) as! BookCollectionCell
            cell.CollectionImage.image = #imageLiteral(resourceName: "file")
            cell.CollectionName.text = contents_name[indexPath.row]
            return cell
        default:
            break
        }
        let cell = self.SelectView.dequeueReusableCell(withReuseIdentifier: "Collection_cell", for: indexPath) as! BookCollectionCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedSection = indexPath.section
        selectedItem = indexPath.row
        performSegue(withIdentifier: "showDetail", sender: self)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        let totalCellWidth = 171 * collectionView.numberOfItems(inSection: 0)
        let totalSpacingWidth = 10 * (collectionView.numberOfItems(inSection: 0) - 1)
        
        let leftInset = (collectionView.frame.width - CGFloat(totalCellWidth + totalSpacingWidth)) / 2
        let rightInset = leftInset
        
        return UIEdgeInsets(top: 0, left: leftInset, bottom: 0, right: rightInset)
    }
    
}
