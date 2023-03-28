//
//  NetworkManager.swift
//  Beer
//
//  Created by Дмитрий Лубов on 25.03.2023.
//

import Foundation
import Alamofire

enum Link {
    case beersURL
    
    var url: URL {
        switch self {
        case .beersURL:
            return URL(string: "https://api.punkapi.com/v2/beers")!
        }
    }
}

enum NetworkError: Error {
    case noData
    case decodingError
}

final class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchBeers(from url: URL, completion: @escaping(Result<[Beer], AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    let beers = Beer.getBeers(from: value)
                    completion(.success(beers))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    func fetchImage(from url: String, completion: @escaping(Result<Data, AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseData { dataResponse in
                switch dataResponse.result {
                case .success(let imageData):
                    completion(.success(imageData))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
