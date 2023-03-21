//
//  MainViewController.swift
//  Beer
//
//  Created by Дмитрий Лубов on 21.03.2023.
//

import UIKit

enum Link: String {
    case beerURL = "https://api.punkapi.com/v2/beers/24"
    case randomBeerURL = "https://api.punkapi.com/v2/beers/random"
    case beersURL = "https://api.punkapi.com/v2/beers"
}

final class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchBeer()
    }
}

// MARK: - Networking
private extension MainViewController {
    func fetchBeer() {
        guard let url = URL(string: Link.beersURL.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let beers = try decoder.decode([Beer].self, from: data)
                print(beers)
            } catch let error {
                print(error)
            }
        }.resume()
    }
}
