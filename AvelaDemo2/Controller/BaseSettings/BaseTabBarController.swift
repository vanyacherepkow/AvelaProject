//
//  BaseTabBarController.swift
//  AvelaDemo2
//
//  Created by Иван on 24.04.2020.
//  Copyright © 2020 vanyacherepkow. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        viewControllers = [
        createNavController(viewController: LatestNewsController(), title: "Главная", imageName: "latest"),
        createNavController(viewController: NewsSearchController(), title: "Поиск", imageName: "search"),
        createNavController(viewController: TagsChooseController(), title: "Теги", imageName: "tags"),
        createNavController(viewController: UserController(), title: "Профиль", imageName: "user")
        
        ]
    }
    
    fileprivate func createNavController(viewController: UIViewController, title: String, imageName: String) -> UIViewController{
        
        let navController = UINavigationController(rootViewController: viewController)
        navController.view.backgroundColor = .white
        viewController.navigationItem.title = title
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named: imageName)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.backgroundColor : UIColor(red: 47/255, green: 68/255, blue: 78/255, alpha: 1.0)], for: .selected)
        
        self.tabBar.tintColor = #colorLiteral(red: 0.5449770689, green: 0.7717760205, blue: 0.2509875894, alpha: 1)
        UITabBar.appearance().barTintColor = #colorLiteral(red: 0.1606041193, green: 0.2344800234, blue: 0.2712118626, alpha: 1)
        
        return navController
    }
    
}
