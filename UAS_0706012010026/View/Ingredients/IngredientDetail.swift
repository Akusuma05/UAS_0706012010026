//
//  IngredientDetail.swift
//  UAS_0706012010026
//
//  Created by SIFT - Telkom DBT Air 2 on 04/06/22.
//

import SwiftUI

struct IngredientDetail: View {
    var ingredient: Ingredient
    
    var body: some View {
        ScrollView {
            SwiftUI.Text(ingredient.strIngredient1)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding([.leading, .bottom, .trailing], 20.0)
            
            SwiftUI.Text(ingredient.strDescription)
                .font(.body)
                .padding()
        }
    }
}

struct IngredientDetail_Previews: PreviewProvider {
    static var previews: some View {
        IngredientDetail(ingredient: ingredients[0])
    }
}
