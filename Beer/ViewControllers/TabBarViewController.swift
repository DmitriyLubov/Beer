//
//  TabBarViewController.swift
//  Beer
//
//  Created by Дмитрий Лубов on 25.03.2023.
//

import UIKit

final class TabBarViewController: UITabBarController {
    
    var beer: Beer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
        setupViewControllers()
    }
}

// MARK: - Private Methods
private extension TabBarViewController {
    func setupTabBar() {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBar.standardAppearance = tabBarAppearance
        tabBar.scrollEdgeAppearance = tabBarAppearance
    }
    
    func setupViewControllers() {
        print(beer ?? "Beer")
    }
}
