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
    
    var selectedTitle = ""
    //let contentData = Book("토끼와 거북이")
    var contentData = Book()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print(selectedTitle)
        //contentData = Book(selectedTitle)
        //contentData.loadKeyword()
        //setPatten()
        self.ContentTable.delegate = self
        self.ContentTable.dataSource = self
        //self.BackgroudView.backgroundColor = UIColor.gray
        
        //FadeIn효과를 위한 초기화
        ContentTable.alpha = 0
        MenuTap.alpha = 0
        ContentTable.backgroundColor = UIColor(white: 1, alpha: 0)
        //스크롤바 숨김
        self.ContentTable.showsVerticalScrollIndicator = false
        //테이블뷰 구분선 숨김
        self.ContentTable.separatorStyle = .none
        
        setSideMenu()
        setStatus()
        
        
        //폰트 변경을 위한 Notify
        NotificationCenter.default.addObserver(self, selector: #selector(reloadTable), name:  Notification.Name(rawValue: "FontResize"), object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //테이블 뷰 갯수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentData.main_content.count
    }
    
    //테이블 뷰 생성
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let mainText = contentData.main_content[indexPath.row]
        let subText = contentData.russian_content[indexPath.row]
        
        let cell = self.ContentTable.dequeueReusableCell(withIdentifier: "TextBoard") as! TextBoardCell
        
        cell.addText(main:mainText, sub:subText)
        cell.mainLabel.font = cell.mainLabel.font.withSize(CGFloat(defaults.float(forKey: "FontSize")))
        cell.subLabel.font = cell.subLabel.font.withSize(CGFloat(defaults.float(forKey: "FontSize")))
        
        cell.selectionStyle = .none
        return cell
    }
    /*
    private func scrollViewDidScroll(scrollView: UIScrollView)  {
        let contentOffSet =  ContentTable.contentOffset.y
        print(contentOffSet)
    }*/

    func setSideMenu(){
        //뷰 컨트롤러 등록
        SideMenuManager.default.menuRightNavigationController = storyboard!.instantiateViewController(withIdentifier: "RightSideMenu") as? UISideMenuNavigationController
        //보여주는 방법
        SideMenuManager.default.menuPresentMode = .viewSlideInOut
        //메뉴 색상(블러)
        //SideMenuManager.default.menuBlurEffectStyle = UIBlurEffectStyle.extraLight
        //애니메이션 옵션
        SideMenuManager.default.menuAnimationOptions = .curveEaseIn
        //부가기능 메뉴 크기 변경
        SideMenuManager.default.menuWidth = 80
    }
    
    func setStatus(){
        if defaults.object(forKey: "FontSize") == nil{
            defaults.set(20.0, forKey: "FontSize")
        }
        defaults.set("kor", forKey: "mainLang")
        defaults.set("rus", forKey: "subLang")
    }
    func setPatten(){
        if kwds.count != 0 {
            for i in contentData.keyword_list{
                pattens.append(ActiveType.custom(pattern: i.keyword_name))
                kwds.append(i)
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //Fade In 구현
        UIView.animate(withDuration: 0.5, animations: {
            self.ContentTable.alpha = 1.0
            self.MenuTap.alpha = 1.0
        })
    }
    /*
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let maxHeight = ContentTable.contentSize.height - ContentTable.bounds.height + ContentTable.contentInset.bottom
        switch ContentTable.contentOffset.y {
        case 0..<maxHeight/3:
            if  BackgroudView.backgroundColor != UIColor.gray{
                UIView.animate(withDuration: 0.5, animations: {
                    self.BackgroudView.backgroundColor = UIColor.gray
                })
            }
            //print("Result : 1")
        case maxHeight/3..<maxHeight/3*2:
            if  BackgroudView.backgroundColor != UIColor.green{
                UIView.animate(withDuration: 0.5, animations: {
                    self.BackgroudView.backgroundColor = UIColor.green
                })
            }
            //print("Result : 2")
        case maxHeight/3*2..<maxHeight:
            if  BackgroudView.backgroundColor != UIColor.brown{
                UIView.animate(withDuration: 0.5, animations: {
                    self.BackgroudView.backgroundColor = UIColor.brown
                })
            }
            //print("Result : 3")
        default:
            break
        }
    }*/
    
    @IBAction func DismissView(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @objc func reloadTable(){
        ContentTable.reloadData()
    }
}
