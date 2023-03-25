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
        
        setupViewControllers()
    }
}

// MARK: - Private Methods
private extension TabBarViewController {
    func setupViewControllers() {
        guard let viewControllers else { return }
        
        viewControllers.forEach { view in
            if let beerInfoVC = view as? BeerInfoViewController {
                beerInfoVC.beer = beer
            } else if let snackVC = view as? SnackViewController {
                snackVC.beer = beer
            } else if let recipeVC = view as? RecipeViewController {
                recipeVC.beer = beer
            }
        }
    }
}
