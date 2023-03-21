//
//  Beer.swift
//  Beer
//
//  Created by Дмитрий Лубов on 21.03.2023.
//

struct Beer {
    let name: String
    
    let alcohol: Double
    let bitterness: Double
        
    let food_pairing: [String]
    
    let ingredients: Recipe
    
    let description: String
    let brewers_tips: String
}

struct Recipe {
    let malt: [Ingredient]
    let hops: [Ingredient]
    let yeast: String
}

struct Ingredient {
    let name: String
}
