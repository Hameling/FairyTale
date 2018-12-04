//
//  SideMenuController.swift
//  Fairytale
//
//  Created by 백승한 on 03/11/2018.
//  Copyright © 2018 WunGim. All rights reserved.
//

import UIKit
import SideMenu
import Presentr
class SideMenuCell:UITableViewVibrantCell{
    @IBOutlet weak var ImageTap: UIImageView!
    @IBOutlet weak var InfoTap: UILabel!
}

class SideMenuController: UITableViewController {
    @IBOutlet var SDView: UITableView!
    let icon_image = [#imageLiteral(resourceName: "font-size"),#imageLiteral(resourceName: "전구"),#imageLiteral(resourceName: "Lock_on"),#imageLiteral(resourceName: "world")]
    let other_icon = #imageLiteral(resourceName: "Lock_off")
    let icon_info = ["Font Size".localized, "Brughtness".localized, "ScreenLock".localized,"Language".localized]

    
    let viewPatten :Presentr = {
        let width = ModalSize.fluid(percentage: 0.6)
        let height = ModalSize.fluid(percentage: 0.3)
        let center = ModalCenterPosition.bottomCenter
        let customType = PresentationType.custom(width: width, height: height, center: center)
        
        let customPresenter = Presentr(presentationType: customType)
        customPresenter.transitionType = .coverVertical
        customPresenter.dismissTransitionType = .crossDissolve
        customPresenter.roundCorners = true
        customPresenter.backgroundColor = .lightGray
        customPresenter.backgroundOpacity = 0.5
        customPresenter.dismissOnSwipe = true
        customPresenter.dismissOnSwipeDirection = .bottom
        return customPresenter
    }()
    
    let doubleviewPatten :Presentr = {
        let width = ModalSize.fluid(percentage: 0.6)
        let height = ModalSize.fluid(percentage: 0.35)
        let center = ModalCenterPosition.bottomCenter
        let customType = PresentationType.custom(width: width, height: height, center: center)
        
        let customPresenter = Presentr(presentationType: customType)
        customPresenter.transitionType = .coverVertical
        customPresenter.dismissTransitionType = .crossDissolve
        customPresenter.roundCorners = true
        customPresenter.backgroundColor = .lightGray
        customPresenter.backgroundOpacity = 0.5
        customPresenter.dismissOnSwipe = true
        customPresenter.dismissOnSwipeDirection = .bottom
        return customPresenter
    }()
    
    let popupPatten :Presentr = {
        let width = ModalSize.fluid(percentage: 0.3)
        let height = ModalSize.fluid(percentage: 0.3)
        let center = ModalCenterPosition.center
        let customType = PresentationType.custom(width: width, height: height, center: center)
        
        let customPresenter = Presentr(presentationType: customType)
        customPresenter.transitionType = .crossDissolve
        customPresenter.dismissTransitionType = .crossDissolve
        customPresenter.backgroundColor = .lightGray
        customPresenter.backgroundOpacity = 0.5
        return customPresenter
    }()
    
    
    let FSView:FontSizeView = {
        let mainBoard = UIStoryboard(name: "Main", bundle: nil)
        let realView = mainBoard.instantiateViewController(withIdentifier: "FontSize")
        return realView as! FontSizeView
    }()
    
    let BCView:BrightChangeView = {
        let mainBoard = UIStoryboard(name: "Main", bundle: nil)
        let realView = mainBoard.instantiateViewController(withIdentifier: "Brightness")
        return realView as! BrightChangeView
    }()
    
    let SLView:ScreenLockView = {
        let mainBoard = UIStoryboard(name: "Main", bundle: nil)
        let realView = mainBoard.instantiateViewController(withIdentifier: "ScreenLock")
        return realView as! ScreenLockView
    }()
    
    let LSView:LanguageSelectView = {
        let mainBoard = UIStoryboard(name: "Main", bundle: nil)
        let realView = mainBoard.instantiateViewController(withIdentifier: "LanugageSelect")
        return realView as! LanguageSelectView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.SDView.separatorStyle = .none
        NotificationCenter.default.addObserver(self, selector: #selector(reloadTable), name:  Notification.Name(rawValue: "ReloadSideMenu"), object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return icon_image.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubFunction", for: indexPath) as! SideMenuCell
        if indexPath.row == 2 && defaults.bool(forKey: "ScreenLockStat"){
            cell.ImageTap.image = other_icon
        }else{
            cell.ImageTap.image = icon_image[indexPath.row]
        }
        cell.InfoTap.text = icon_info[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sideMenuIndex = indexPath.row
        switch sideMenuIndex {
        case 0:
            customPresentViewController(viewPatten, viewController: FSView, animated: true)
        case 1:
            customPresentViewController(viewPatten, viewController: BCView, animated: true)
        case 2:
            customPresentViewController(popupPatten, viewController: SLView, animated: true)
        case 3:
            customPresentViewController(doubleviewPatten, viewController: LSView, animated: true)
        default:
            break
        }
    }
    @objc func reloadTable(){
        SDView.reloadData()
    }
}
