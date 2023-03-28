//
//  BeerCollectionViewCell.swift
//  Beer
//
//  Created by Дмитрий Лубов on 25.03.2023.
//

import UIKit

final class BeerCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var beerImage: UIImageView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    private let networkManager = NetworkManager.shared
    
    func configure(with beer: Beer) {
        nameLabel.text = beer.name
        
        imageWillLoad()
        fetchImage(from: beer.imageUrl)
    }
}

// MARK: - Private Methods
private extension BeerCollectionViewCell {
    func imageWillLoad() {
        nameLabel.isHidden = true
        beerImage.isHidden = true
        activityIndicator.startAnimating()
    }
    
    func imageDidLoad() {
        nameLabel.isHidden = false
        beerImage.isHidden = false
        activityIndicator.stopAnimating()
    }
    
    func fetchImage(from url: String) {
        networkManager.fetchImage(from: url) { [weak self] result in
            switch result {
            case .success(let imageData):
                self?.beerImage.image = UIImage(data: imageData)
                self?.imageDidLoad()
            case .failure(let error):
                print(error)
                self?.beerImage.image = UIImage(systemName: "camera")
                self?.beerImage.tintColor = .white
                self?.imageDidLoad()
            }
        }
    }
}
