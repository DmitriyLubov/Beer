//
//  Beer.swift
//  Beer
//
//  Created by Дмитрий Лубов on 21.03.2023.
//

import Foundation

struct Beer: Decodable {
    let name: String
    let imageUrl: URL
    let beerInfo: String
    
    let alcohol: Double
    let snacks: [String]

    let recipe: Recipe
    let brewersTip: String
}

struct Recipe: Decodable {
    let malt: [Ingredient]
    let hops: [Ingredient]
    let yeast: String
}

struct Ingredient: Decodable {
    let name: String
}

extension Beer {
    enum CodingKeys: String, CodingKey {
        case name
        case imageUrl = "image_url"
        case beerInfo = "description"
        case alcohol = "abv"
        case snacks = "food_pairing"
        case recipe = "ingredients"
        case brewersTip = "brewers_tips"
    }
}
