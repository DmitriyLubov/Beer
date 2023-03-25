//
//  BeerCollectionViewController.swift
//  Beer
//
//  Created by Дмитрий Лубов on 25.03.2023.
//

import UIKit

final class BeerCollectionViewController: UICollectionViewController {
    
    private let networkManager = NetworkManager.shared
    private var beers: [Beer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchBeers()
    }
}

// MARK: - UICollectionViewDataSource
extension BeerCollectionViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        beers.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "beerCell",
            for: indexPath
        )
        guard let cell = cell as? BeerCollectionViewCell else { return UICollectionViewCell() }
        
        cell.configure(with: beers[indexPath.item])
        
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension BeerCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.width - 52) / 3
        
        return CGSize(width: width, height: width * 2)
    }
}

// MARK: - Networking
extension BeerCollectionViewController {
    private func fetchBeers() {
        networkManager.fetch([Beer].self, from: Link.beersURL.url) { [weak self] result in
            switch result {
            case .success(let beers):
                self?.beers = beers
                self?.collectionView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}
