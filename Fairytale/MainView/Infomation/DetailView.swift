//
//  DetailView.swift
//  Fairytale
//
//  Created by 백승한 on 05/11/2018.
//  Copyright © 2018 WunGim. All rights reserved.
//

import UIKit

class DetailView: UIViewController {

    @IBOutlet weak var DetailImage: UIImageView!
    @IBOutlet weak var DetailTitle: UILabel!
    @IBOutlet weak var DetailContent: UITextView!

    var fairytale_title = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switch selectedSection {
        case 0:
            fairytale_title = String(selectedSection) + "번 섹션" + contents_name[selectedItem]
        case 1:
            fairytale_title = String(selectedSection) + "번 섹션" + contents_name[selectedItem]
        case 2:
            fairytale_title = String(selectedSection) + "번 섹션" + contents_name[selectedItem]
        default:
            break
        }
        
        DetailTitle.text = fairytale_title
        self.reloadInputViews()
        // Do any additional setup after loading the view.
    }
    @IBAction func PerformReading(_ sender: Any) {
    }
    @IBAction func exitView(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
