//
//  Drink.swift
//  UAS_0706012010026
//
//  Created by SIFT - Telkom DBT Air 2 on 23/05/22.
//

import Foundation
import SwiftUI

struct Drinkclass: Hashable, Codable{
    let drinks: [Drink]
}

struct Drink: Hashable, Codable {
    var idDrink: String
    var strDrink: String
    var strCategory: String
    var strInstructions: String
    
    var strIngredient1: String
    var strIngredient2: String?
    var strIngredient3: String?
    var strIngredient4: String?
    var strIngredient5: String?
    
    var strMeasure1: String
    var strMeasure2: String?
    var strMeasure3: String?
    var strMeasure4: String?
    var strMeasure5: String?
    
    var strDrinkThumb: String
    var image: Image {
        Image(strDrinkThumb)
    }
}

