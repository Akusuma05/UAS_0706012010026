//
//  IngredientView.swift
//  UAS_0706012010026
//
//  Created by SIFT - Telkom DBT Air 2 on 04/06/22.
//

import SwiftUI

struct IngredientView: View {
    @State var searchText = ""
    @State var viewModelIngredient = ViewModelIngredient()
    
    var body: some View {
        NavigationView {
            List(filteredIngredient, id: \.self) { ingredient in
                NavigationLink {
                    IngredientDetail(ingredient: ingredient)
                } label: {
                    IngredientRow(ingredient: ingredient)
                }
            }
            .navigationTitle("Ingredient List")
            .onAppear(){
                viewModelIngredient.search()
            }
            .searchable(text: $searchText, prompt: "Find an ingredient")
            .onChange(of: searchText) { data in
                viewModelIngredient.search(with: data)
            }
            
        }
    }
}

struct IngredientView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientView()
    }
}
