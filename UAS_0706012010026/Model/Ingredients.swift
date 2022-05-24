//
//  Ingredients.swift
//  UAS_0706012010026
//
//  Created by SIFT - Telkom DBT Air 2 on 23/05/22.
//

import Foundation
struct Ingredients : Codable {
    let idIngredient : String?
    let strIngredient : String?
    let strDescription : String?
    let strType : String?
    let strAlcohol : String?
    let strABV : String?
    
    enum CodingKeys: String, CodingKey {
        
        case idIngredient = "idIngredient"
        case strIngredient = "strIngredient"
        case strDescription = "strDescription"
        case strType = "strType"
        case strAlcohol = "strAlcohol"
        case strABV = "strABV"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        idIngredient = try values.decodeIfPresent(String.self, forKey: .idIngredient)
        strIngredient = try values.decodeIfPresent(String.self, forKey: .strIngredient)
        strDescription = try values.decodeIfPresent(String.self, forKey: .strDescription)
        strType = try values.decodeIfPresent(String.self, forKey: .strType)
        strAlcohol = try values.decodeIfPresent(String.self, forKey: .strAlcohol)
        strABV = try values.decodeIfPresent(String.self, forKey: .strABV)
    }
    
}
