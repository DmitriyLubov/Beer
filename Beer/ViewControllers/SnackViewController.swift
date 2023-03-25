//
//  SnackViewController.swift
//  Beer
//
//  Created by Дмитрий Лубов on 26.03.2023.
//

import UIKit

final class SnackViewController: UIViewController {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var snackTextView: UITextView!
    
    var beer: Beer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = beer.name
        snackTextView.text = beer.descriptionSnack
    }
}
