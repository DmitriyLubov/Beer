//
//  BeerInfoViewController.swift
//  Beer
//
//  Created by Дмитрий Лубов on 25.03.2023.
//

import UIKit

final class BeerInfoViewController: UIViewController {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var beerInfoTV: UITextView!
    
    @IBOutlet var beerImage: UIImageView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    var beer: Beer!
    
    private let networkManager = NetworkManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
}

// MARK: - Private Methods
private extension BeerInfoViewController {
    func setupView() {
        activityIndicator.startAnimating()
        
        nameLabel.text = beer.name
        beerInfoTV.text = beer.descriptionBeer
        
        fetchImage(from: beer.imageUrl)
    }
    
    func fetchImage(from url: String) {
        networkManager.fetchImage(from: url) { [weak self] result in
            switch result {
            case .success(let imageData):
                self?.beerImage.image = UIImage(data: imageData)
                self?.activityIndicator.stopAnimating()
            case .failure(let error):
                print(error)
                self?.beerImage.image = UIImage(systemName: "camera")
                self?.beerImage.tintColor = .white
                self?.activityIndicator.stopAnimating()
            }
        }
    }
}
