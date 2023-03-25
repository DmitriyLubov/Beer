//
//  TabBarViewController.swift
//  Beer
//
//  Created by Дмитрий Лубов on 25.03.2023.
//

import UIKit

final class TabBarViewController: UITableViewController {
    
    var beer: Beer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
    }
    
    private func setupViewControllers() {
        print(beer ?? "Beer")
    }
}
