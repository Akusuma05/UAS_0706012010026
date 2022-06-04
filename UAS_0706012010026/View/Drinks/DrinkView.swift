//
//  DrinkView.swift
//  UAS_0706012010026
//
//  Created by SIFT - Telkom DBT Air 2 on 04/06/22.
//

import SwiftUI

struct DrinkView: View {
    @StateObject var viewModeldrink = ViewModelDrink()
    @State var searchText = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModeldrink.filteredDrink, id:\.self){ Drink in
                    NavigationLink(destination: DrinkDetail(drink: Drink)) {
                        DrinkRow(drink: Drink)
                    }
                }
            }
            .navigationTitle("Drink List")
            .onAppear(){
                viewModeldrink.fetch()
            }
            .searchable(text: $searchText, prompt: "Find a drink")
            .onChange(of: searchText) { data in
                viewModeldrink.search(with: data)
            }
        }
    }
}

struct DrinkView_Previews: PreviewProvider {
    static var previews: some View {
        DrinkView()
    }
}
