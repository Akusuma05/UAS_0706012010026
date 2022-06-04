//
//  ViewModel.swift
//  UAS_0706012010026
//
//  Created by SIFT - Telkom DBT Air 2 on 28/05/22.
//

import Foundation
import SwiftUI

//View Model Ingredient
class ViewModelIngredient: ObservableObject{
    @Published var ingredient: [Ingredient] = []

    func fetch(){
        guard let url = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list") else {
            return
        }

        let task = URLSession.shared.dataTask(with: url) {[weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }

            //Convert to JSON
            do{
                let ingredients = try JSONDecoder().decode(IngredientClass.self, from: data)
                DispatchQueue.main.async {
                    self?.ingredient = ingredients.drinks
                }
                
            }
            catch{

            }

        }
        task.resume()
    }
}

//View Model Drink
class ViewModelDrink: ObservableObject{
    @Published var drink: [Drink] = []

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
                }
                
            }
            catch{

            }

        }
        task.resume()
    }
}

//View Model Drink Random
class ViewModelRandom: ObservableObject{
    @Published var drink: [Drink] = []

    func fetch(){
        guard let url = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/random.php") else {
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
                }
                
            }
            catch{

            }

        }
        task.resume()
    }
}

