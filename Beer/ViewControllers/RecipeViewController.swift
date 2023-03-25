//
//  RecipeViewController.swift
//  Beer
//
//  Created by Дмитрий Лубов on 26.03.2023.
//

import UIKit

final class RecipeViewController: UIViewController {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var recipeTextView: UITextView!
    
    var beer: Beer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = beer.name
        recipeTextView.text = beer.descriptionRecipe
    }
}
