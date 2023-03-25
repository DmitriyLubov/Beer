//
//  BeerCollectionViewCell.swift
//  Beer
//
//  Created by Дмитрий Лубов on 25.03.2023.
//

import UIKit

final class BeerCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var imageBeer: UIImageView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    private let networkManager = NetworkManager.shared
    
    func configure(with beer: Beer) {
        imageWillAppear()
        fetchImage(from: beer.imageUrl)
    }
}

// MARK: - Private Methods
private extension BeerCollectionViewCell {
    func imageWillAppear() {
        imageBeer.isHidden = true
        activityIndicator.startAnimating()
    }
    
    func imageDidAppear() {
        imageBeer.isHidden = false
        activityIndicator.stopAnimating()
    }
    
    func fetchImage(from url: URL) {
        networkManager.fetchImage(from: url) { [weak self] result in
            switch result {
            case .success(let imageData):
                self?.imageBeer.image = UIImage(data: imageData)
            case .failure(_):
                DispatchQueue.main.async {
                    self?.imageBeer.image = UIImage(systemName: "camera")
                    self?.imageBeer.tintColor = .white
                }
            }
            self?.imageDidAppear()
        }
    }
}
