//
//  ViewController.swift
//  Fairytale
//
//  Created by window on 2018. 10. 12..
//  Copyright © 2018년 WunGim. All rights reserved.
//

import UIKit
import ActiveLabel
import SCLAlertView
import PySwiftyRegex

class ViewController : UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var ContentTable: UITableView!
    let contentData = Book(filename: "fox")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ContentTable.delegate = self
        self.ContentTable.dataSource = self

        //스크롤바 숨김
        self.ContentTable.showsVerticalScrollIndicator = false
        //테이블뷰 구분선 숨김
        //self.ContentTable.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.ContentTable.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //테이블 뷰 갯수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentData.main_content.count
    }
    
    //테이블 뷰 생성
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let mainText = contentData.main_content[indexPath.row]
        let subText = "Sub Language Text"
        
        let cell = self.ContentTable.dequeueReusableCell(withIdentifier: "TextBoard") as! TextBoardCell
        cell.addText(main:mainText, sub:subText)
        cell.selectionStyle = .none
        return cell
    }
    
    //설정 호출 버튼
    @IBAction func SettingButton(_ sender: Any) {
       let uvc = self.storyboard?.instantiateViewController(withIdentifier: "SettingView")
        uvc?.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        
        
        self.present(uvc!,animated:true, completion:nil)
    }
    //슬라이드메뉴 호출 버튼
    @IBAction func SlideShowButton(_ sender: Any) {
         SCLAlertView().showInfo("Important info", subTitle: "You are great")
    }
}

