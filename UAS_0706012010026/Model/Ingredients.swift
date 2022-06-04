//
//  Ingredients.swift
//  UAS_0706012010026
//
//  Created by SIFT - Telkom DBT Air 2 on 23/05/22.
//

import Foundation

struct IngredientClass: Codable, Hashable {
    let drinks: [Ingredient]
}

struct Ingredient: Hashable, Codable {
    var strIngredient1: String
    var strDescription: String
}
