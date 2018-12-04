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
    @IBOutlet weak var BackgroudImage: UIImageView!
    
    var selectedTitle = ""
    var contentData = Book()
    let setProgress = Setting()
    let subject = Subject()
    var imageSet:[UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.ContentTable.delegate = self
        self.ContentTable.dataSource = self
        
        imageSet = self.subject.bg_list[selectedSection][selectedItem]
        BackgroudImage.image = imageSet[0]
        //FadeIn효과를 위한 초기화
        ContentTable.alpha = 0
        MenuTap.alpha = 0
        ContentTable.backgroundColor = UIColor(white: 1, alpha: 0)
        
        //스크롤바 숨김
        self.ContentTable.showsVerticalScrollIndicator = false
        //테이블뷰 구분선 숨김
        self.ContentTable.separatorStyle = .none
        
        setSideMenu()
        
        //폰트 변경을 위한 Notify
        NotificationCenter.default.addObserver(self, selector: #selector(reloadTable), name:  Notification.Name(rawValue: "ReloadTable"), object: nil)
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
        
        var mainText = "", subText = ""
        switch defaults.string(forKey: "mainLang")!{
        case "kor":
            mainText = contentData.main_content[indexPath.row]
        case "rus":
            mainText = contentData.russian_content[indexPath.row]
        case "jap":
            mainText = contentData.japanese_content[indexPath.row]
        default:
            break;
        }
        switch defaults.string(forKey: "subLang")!{
        case "kor":
            subText = contentData.main_content[indexPath.row]
        case "rus":
            subText = contentData.russian_content[indexPath.row]
        case "jap":
            subText = contentData.japanese_content[indexPath.row]
        default:
            break;
        }
        
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //Fade In 구현
        UIView.animate(withDuration: 0.5, animations: {
            self.ContentTable.alpha = 1.0
            self.MenuTap.alpha = 1.0
        })
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let maxHeight = ContentTable.contentSize.height - ContentTable.bounds.height + ContentTable.contentInset.bottom
        switch ContentTable.contentOffset.y {
        case 0..<maxHeight/3:
            if  BackgroudImage.image != imageSet[0]{
                BackgroudImage.alpha = 0.0
                UIView.animate(withDuration: 0.8, animations: {
                    self.BackgroudImage.image = self.imageSet[0]
                    self.BackgroudImage.alpha = 0.2
                })
            }
            //print("Result : 1")
        case maxHeight/3..<maxHeight/3*2:
            if  BackgroudImage.image != imageSet[1]{
                BackgroudImage.alpha = 0.0
                UIView.animate(withDuration: 0.8, animations: {
                    self.BackgroudImage.image = self.imageSet[1]
                    self.BackgroudImage.alpha = 0.2
                })
            }
            //print("Result : 2")
        case maxHeight/3*2..<maxHeight:
            if  BackgroudImage.image != imageSet[2]{
                BackgroudImage.alpha = 0.0
                UIView.animate(withDuration: 0.8, animations: {
                    self.BackgroudImage.image = self.imageSet[2]
                    self.BackgroudImage.alpha = 0.2
                })
            }
            //print("Result : 3")
        default:
            break
        }
    }
    
    @IBAction func DismissView(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @objc func reloadTable(){
        ContentTable.reloadData()
    }
}
