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
    let Subject_Info = Subject()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DetailTitle.text = Subject_Info.book_list[selectedSection][selectedItem]
        self.reloadInputViews()
        // Do any additional setup after loading the view.
    }
    @IBAction func PerformReading(_ sender: Any) {
        performSegue(withIdentifier: "showReadingView", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showReadingView"{
            
            let reading = segue.destination as! ViewController
            
            reading.selectedTitle = Subject_Info.book_list[selectedSection][selectedItem]
        }
    }
    @IBAction func exitView(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
