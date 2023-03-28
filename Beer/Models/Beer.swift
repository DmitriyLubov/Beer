//
//  Beer.swift
//  Beer
//
//  Created by Дмитрий Лубов on 21.03.2023.
//

import Foundation

struct Beer: Decodable {
    let name: String
    let imageUrl: String
    let beerInfo: String
    
    let alcohol: Double
    let snacks: [String]

    let recipe: Recipe
    let brewersTip: String
    
    var descriptionBeer: String {
        """
        Alcohol: \(alcohol)% abv
        
        \(beerInfo)
        """
    }
    
    var descriptionSnack: String {
        """
        Food pairing:
         - \(snacks.map { $0 }.joined(separator: "\n - "))
        """
    }
    
    var descriptionRecipe: String {
        """
        Ingredients:
            malt:
             - \(recipe.malt.map { $0.name }.joined(separator: "\n     - "))
            hops:
             - \(recipe.hops.map { $0.name }.joined(separator: "\n     - "))
            yeast:
             - \(recipe.yeast)
        
        Brewers tips:
        \(brewersTip)
        """
    }
    
    init(beersData: [String: Any]) {
        name = beersData["name"] as? String ?? ""
        imageUrl = beersData["image_url"] as? String ?? ""
        beerInfo = beersData["description"] as? String ?? ""
        alcohol = beersData["abv"] as? Double ?? 0.0
        snacks = beersData["food_pairing"] as? [String] ?? []
        recipe = Recipe.getRecipe(from: beersData["ingredients"])
        brewersTip = beersData["brewers_tips"] as? String ?? ""
    }
    
    static func getBeers(from value: Any) -> [Beer] {
        guard let beersData = value as? [[String: Any]] else { return [] }
        
        return beersData.map { Beer(beersData: $0) }
    }
}

struct Recipe: Decodable {
    let malt: [Ingredient]
    let hops: [Ingredient]
    let yeast: String
    
    init(recipeData: [String: Any]) {
        malt = Ingredient.getIngredients(from: recipeData["malt"])
        hops = Ingredient.getIngredients(from: recipeData["hops"])
        yeast = recipeData["yeast"] as? String ?? ""
    }
    
    static func getRecipe(from value: Any?) -> Recipe {
        guard let recipeData = value as? [String: Any] else {
            return Recipe(recipeData: [:])
        }
        
        return Recipe(recipeData: recipeData)
    }
}

struct Ingredient: Decodable {
    let name: String
    
    init(ingredientData: [String: Any]) {
        name = ingredientData["name"] as? String ?? ""
    }
    
    static func getIngredients(from value: Any?) -> [Ingredient] {
        guard let ingredientData = value as? [[String: Any]] else { return [] }
        
        return ingredientData.map { Ingredient(ingredientData: $0) }
    }
}
