//
//  ViewModel.swift
//  UAS_0706012010026
//
//  Created by SIFT - Telkom DBT Air 2 on 04/06/22.
//

import Foundation

//Variable JSON
var drinks: [Drink] = load("drinkData.json")
var ingredients: [Ingredient] = load("ingredientData.json")
var filteredIngredient = ingredients

//Api Drink
class ViewModelDrink: ObservableObject{
    @Published var drink: [Drink] = []
    @Published var filteredDrink = [Drink]()

    func fetch(){
        guard let url = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=a") else {
            return
        }

        let task = URLSession.shared.dataTask(with: url) {[weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }

            //Convert to JSON
            do{
                let drinks = try JSONDecoder().decode(Drinkclass.self, from: data)
                DispatchQueue.main.async {
                    self?.drink = drinks.drinks
                    self?.filteredDrink = drinks.drinks
                }
                
            }
            catch{

            }

        }
        task.resume()
    }
    //Search Drink
    func search(with query: String = "") {
        filteredDrink = query.isEmpty ? drink : drink.filter { $0.strDrink.localizedStandardContains(query) }
    }
}

//JSON Ingredient
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

//SearchIngredient
class ViewModelIngredient {
    func search(with query: String = "") {
        filteredIngredient = query.isEmpty ? ingredients : ingredients.filter { $0.strIngredient1.localizedStandardContains(query) }
    }
}
