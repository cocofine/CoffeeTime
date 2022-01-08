//
//  BaseTabBarController.swift
//  CoffeeTime
//
//  Created by ouyangqi on 2022/1/8.
//

import UIKit

class BaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let homeVC = HomeController()
        homeVC.tabBarItem.title = "首页"
        homeVC.tabBarItem.image = UIImage.init(systemName: "house")
        homeVC.tabBarItem.selectedImage = UIImage.init(systemName: "house.fill")
        let homeNav = UINavigationController.init(rootViewController: homeVC)
        
        let discoveryVC = DiscoveryController()
        discoveryVC.tabBarItem.title = "发现"
        discoveryVC.tabBarItem.image = UIImage.init(systemName: "magnifyingglass.circle")
        discoveryVC.tabBarItem.selectedImage = UIImage.init(systemName: "magnifyingglass.circle.fill")
        let discoveryNav = UINavigationController.init(rootViewController: discoveryVC)
        
        let shopVC = ShopController()
        shopVC.tabBarItem.title = "商城"
        shopVC.tabBarItem.image = UIImage.init(systemName: "cart")
        shopVC.tabBarItem.selectedImage = UIImage.init(systemName: "cart.fill")
        let shopNav = UINavigationController.init(rootViewController: shopVC)

        let mineVC = MineController()
        mineVC.tabBarItem.title = "我的"
        mineVC.tabBarItem.image = UIImage.init(systemName: "person")
        mineVC.tabBarItem.selectedImage = UIImage.init(systemName: "person.fill")
        let mineNav = UINavigationController.init(rootViewController: mineVC)

        self.viewControllers = [homeNav, discoveryNav, shopNav, mineNav]
        
        self.tabBar.backgroundColor = UIColor.white
        
//        self.selectedIndex = 2
    }
    



}
