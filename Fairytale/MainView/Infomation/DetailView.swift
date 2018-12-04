//
//  DetailView.swift
//  Fairytale
//
//  Created by 백승한 on 05/11/2018.
//  Copyright © 2018 WunGim. All rights reserved.
//

import UIKit
import ActiveLabel

class DetailView: UIViewController {

    @IBOutlet weak var DetailImage: UIImageView!
    @IBOutlet weak var DetailTitle: UILabel!
    @IBOutlet weak var DetailBG: UIView!
    @IBOutlet weak var DetailContent: UITextView!
    @IBOutlet weak var DetailBtn: UIButton!
    
    let Subject_Info = Subject()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DetailImage.image = Subject_Info.logo_image[selectedSection][selectedItem]
        DetailTitle.text = Subject_Info.book_list[selectedSection][selectedItem]
        DetailContent.text = Subject_Info.detailText[selectedSection][selectedItem]
        DetailImage.layer.shadowColor = UIColor.darkGray.cgColor
        DetailImage.layer.shadowOpacity = 0.6
        DetailImage.layer.shadowOffset = CGSize(width: 0.0 , height: 5.0)
        DetailImage.layer.masksToBounds = false
        
        DetailBtn.layer.shadowColor = UIColor.darkGray.cgColor
        DetailBtn.layer.shadowOpacity = 0.5
        DetailBtn.layer.shadowOffset = CGSize(width: 0.0 , height: 1.0)
        DetailBtn.layer.masksToBounds = false
        
        self.reloadInputViews()
    }
    @IBAction func PerformReading(_ sender: Any) {
        performSegue(withIdentifier: "showReadingView", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showReadingView"{
            let reading = segue.destination as! ViewController
            //reading.selectedTitle = Subject_Info.book_list[selectedSection][selectedItem]
            reading.contentData = Book(Subject_Info.book_list[selectedSection][selectedItem])
            reading.contentData.loadKeyword()
            for i in reading.contentData.keyword_list{
                pattens.append(ActiveType.custom(pattern:i.keyword_name))
                kwds.append(i)
            }
            
        }
    }
    @IBAction func exitView(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
