//
//  TabBarController.swift
//  29th-Assignment-Youtube
//
//  Created by 김수연 on 2021/10/17.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
    }
    
    func setTabBar() {
        guard let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC"),
              let shortsVC = self.storyboard?.instantiateViewController(withIdentifier: "ShortsVC"),
              let addVC = self.storyboard?.instantiateViewController(withIdentifier: "AddVC"),
              let subscribeVC = self.storyboard?.instantiateViewController(withIdentifier: "SubscribeVC"),
              let keepVC = self.storyboard?.instantiateViewController(withIdentifier: "KeepVC")
        else { return }
        
        UITabBar.appearance().tintColor = UIColor.black
        
        homeVC.tabBarItem.title = "홈"
        homeVC.tabBarItem.image = UIImage(named: "homeIcon")
        homeVC.tabBarItem.selectedImage = UIImage(named: "homeIconFill")
        shortsVC.tabBarItem.title = "Shorts"
        shortsVC.tabBarItem.image = UIImage(named: "shortsIcon")
        addVC.tabBarItem.title = "추가"
        addVC.tabBarItem.image = UIImage(named: "plusCircleIcon")
        subscribeVC.tabBarItem.title = "구독"
        subscribeVC.tabBarItem.image = UIImage(named: "subscriptionsIcon")
        subscribeVC.tabBarItem.selectedImage = UIImage(named: "subscriptionsIconFill")
        keepVC.tabBarItem.title = "보관함"
        keepVC.tabBarItem.image = UIImage(named: "LibraryIcon")
        keepVC.tabBarItem.selectedImage = UIImage(named: "LibraryIconFill")
        
        setViewControllers([homeVC,shortsVC, addVC, subscribeVC, keepVC], animated: true)
    
    }
    
}
