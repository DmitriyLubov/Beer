//
//  BeerInfoViewController.swift
//  Beer
//
//  Created by Дмитрий Лубов on 25.03.2023.
//

import UIKit

final class BeerInfoViewController: UIViewController {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var beerImage: UIImageView!
    @IBOutlet var beerInfoTV: UITextView!
    
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
        nameLabel.text = beer.name
        beerInfoTV.text = beer.descriptionBeer
        
        fetchImage(from: beer.imageUrl)
    }
    
    func fetchImage(from url: URL) {
        networkManager.fetchImage(from: url) { [weak self] result in
            switch result {
            case .success(let imageData):
                self?.beerImage.image = UIImage(data: imageData)
            case .failure(_):
                DispatchQueue.main.async {
                    self?.beerImage.image = UIImage(systemName: "camera")
                    self?.beerImage.tintColor = .white
                }
            }
        }
    }
}
