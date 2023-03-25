//
//  Beer.swift
//  Beer
//
//  Created by Дмитрий Лубов on 21.03.2023.
//

import Foundation

struct Beer: Decodable {
    let name: String
    let image_url: URL
    let description: String
    
    let abv: Double
    let food_pairing: [String]

    let ingredients: Recipe
    let brewers_tips: String
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
    enum CodinKeys: String, CodingKey {
        case name
        case imageUrl = "image_url"
        case beerInfo = "description"
        case alcohol = "abv"
        case snacks = "food_pairing"
        case recipe = "ingredients"
        case brewersTip = "brewers_tips"
    }
}
