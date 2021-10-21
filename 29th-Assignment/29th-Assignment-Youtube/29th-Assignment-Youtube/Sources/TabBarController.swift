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
              let plusVC = self.storyboard?.instantiateViewController(withIdentifier: "PlusVC"),
              let subscriptionVC = self.storyboard?.instantiateViewController(withIdentifier: "SubscriptionVC"),
              let libraryVC = self.storyboard?.instantiateViewController(withIdentifier: "LibraryVC")
        else { return }
        
        UITabBar.appearance().tintColor = UIColor.black
        
        homeVC.tabBarItem = UITabBarItem(title: "홈", image: UIImage(named: "homeIcon"), selectedImage: UIImage(named: "homeIconFill"))
        shortsVC.tabBarItem = UITabBarItem(title: "Shorts", image: UIImage(named: "shortsIcon"), selectedImage: UIImage(named: "shortsIconFill"))
        plusVC.tabBarItem = UITabBarItem(title: "추가", image: UIImage(named: "plusCircleIcon"), selectedImage: UIImage(named: "plusCircleIcon"))
        subscriptionVC.tabBarItem = UITabBarItem(title: "구독", image: UIImage(named: "subscriptionsIcon"), selectedImage: UIImage(named: "subscriptionsIconFill"))
        libraryVC.tabBarItem = UITabBarItem(title: "보관함", image: UIImage(named: "LibraryIcon"), selectedImage: UIImage(named: "LibraryIconFill"))
        

        
        setViewControllers([homeVC,shortsVC, plusVC, subscriptionVC, libraryVC], animated: true)
    
    }
    
}
