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
import SideMenu

class ViewController : UIViewController, UITableViewDelegate, UITableViewDataSource{
    @IBOutlet var BackgroudView: UIView!
    @IBOutlet weak var ContentTable: UITableView!
    @IBOutlet weak var MenuTap: UIView!
    
    //나중에 파일 값 받아서 사용하도록
    let contentData = Book("rabbit&tutle")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ContentTable.delegate = self
        self.ContentTable.dataSource = self
        
        //FadeIn효과를 위한 초기화
        ContentTable.alpha = 0
        MenuTap.alpha = 0
        ContentTable.backgroundColor = UIColor(white: 1, alpha: 0)
        //스크롤바 숨김
        self.ContentTable.showsVerticalScrollIndicator = false
        //테이블뷰 구분선 숨김
        //self.ContentTable.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        setSideMenu()
        
        //폰트 변경을 위한 Notify
        NotificationCenter.default.addObserver(self, selector: #selector(reloadTable), name:  Notification.Name(rawValue: "FontResize"), object: nil)
        
        //NotificationCenter.default.addObserver(self, selector: <#T##Selector#>, name: <#T##NSNotification.Name?#>, object: <#T##Any?#>)
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
        cell.mainLabel.font = cell.mainLabel.font.withSize(CGFloat(defaults.float(forKey: "FontSize")))
        cell.subLabel.font = cell.subLabel.font.withSize(CGFloat(defaults.float(forKey: "FontSize")))
        
        cell.selectionStyle = .none
        return cell
    }
    
    private func scrollViewDidScroll(scrollView: UIScrollView)  {
        let contentOffSet =  ContentTable.contentOffset.y
        print(contentOffSet)
    }

    func setSideMenu(){
        //뷰 컨트롤러 등록
        SideMenuManager.default.menuRightNavigationController = storyboard!.instantiateViewController(withIdentifier: "RightSideMenu") as? UISideMenuNavigationController
        //보여주는 방법
        SideMenuManager.default.menuPresentMode = .viewSlideInOut
        //메뉴 색상(블러)
        SideMenuManager.default.menuBlurEffectStyle = UIBlurEffect.Style.extraLight
        //애니메이션 옵션
        SideMenuManager.default.menuAnimationOptions = .curveEaseIn
        //부가기능 메뉴 크기 변경
        SideMenuManager.default.menuWidth = 110
    }
    
    func setStatus(){
        defaults.set(17.0, forKey: "FontSize")
        defaults.set("kor", forKey: "mainLang")
        defaults.set("rus", forKey: "subLang")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //Fade In 구현
        UIView.animate(withDuration: 1, animations: {
            self.ContentTable.alpha = 1.0
            self.MenuTap.alpha = 1.0
        })
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(ContentTable.contentOffset.y)
        print(ContentTable.contentSize.height - ContentTable.bounds.height + ContentTable.contentInset.bottom)
    }
    
    @objc func reloadTable(){
        ContentTable.reloadData()
    }
    @objc func changeBGColor(){
        let colors = [UIColor.gray,UIColor.green,UIColor.brown]
    }
}
