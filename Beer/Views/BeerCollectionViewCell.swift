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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        activityIndicator.hidesWhenStopped = true
    }
    
    func configure(with beer: Beer) {
        imageWillApear()
        fetchImage(from: beer.imageUrl)
    }
}

// MARK: - Private Methods
private extension BeerCollectionViewCell {
    func imageWillApear() {
        imageBeer.isHidden = true
        activityIndicator.startAnimating()
    }
    
    func imageDidApear() {
        imageBeer.isHidden = false
        activityIndicator.stopAnimating()
    }
    
    func fetchImage(from url: URL) {
        networkManager.fetchImage(from: url) { [weak self] result in
            switch result {
            case .success(let imageData):
                self?.imageBeer.image = UIImage(data: imageData)
            case .failure(_):
                self?.imageBeer.image = UIImage(systemName: "camera")
                self?.imageBeer.tintColor = .white
            }
            self?.imageDidApear()
        }
    }
}
