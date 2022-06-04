//
//  DrinkDetail.swift
//  UAS_0706012010026
//
//  Created by SIFT - Telkom DBT Air 2 on 04/06/22.
//

import SwiftUI

struct DrinkDetail: View {
    var drink: Drink
    
    var body: some View {
        ScrollView {
            Text(drink.strDrink)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            URLImageDrinkDetail(urlString: drink.strDrinkThumb)
            
            Text("Ingredients")
                .font(.title2)
                .fontWeight(.bold)
                .padding()
            
            Text(drink.strMeasure1 + drink.strIngredient1)

            if drink.strIngredient2 != nil {
                if drink.strMeasure2 != nil {
                    Text(drink.strMeasure2!) + Text(drink.strIngredient2!)
                }
            }
            
            if drink.strIngredient3 != nil {
                if drink.strMeasure3 != nil {
                   Text(drink.strMeasure3!) + Text(drink.strIngredient3!)
                }
            }

            if drink.strIngredient4 != nil {
                if drink.strMeasure4 != nil {
                  Text(drink.strMeasure4!) + Text(drink.strIngredient4!)
                }
            }

            if drink.strIngredient5 != nil {
                if drink.strMeasure5 != nil{
                    Text(drink.strMeasure5!) + Text(drink.strIngredient5!)
                }
            }
            
           Text("Instructions")
                .font(.title2)
                .fontWeight(.bold)
                .padding()
            
           Text(drink.strInstructions)
                .font(.body)
                .padding()
            
        }
    }
}

struct URLImageDrinkDetail: View {
    let urlString: String
    @State var data: Data?
    
    var body: some View {
        if let data = data, let uiimage = UIImage(data: data) {
            Image(uiImage: uiimage)
                .resizable()
                .frame(width: 300, height: 300)
                .cornerRadius(15)
        }
        else {
            Image("")
                .resizable()
                .frame(width: 300, height: 300)
                .cornerRadius(15)
                .onAppear{
                    fetchData()
                }
        }
    }
    
    func fetchData() {
        guard let url = URL(string: urlString) else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ data, _, _  in
            self.data = data
        }
        task.resume()
    }
}

struct DrinkDetail_Previews: PreviewProvider {
    static var previews: some View {
        DrinkDetail(drink: drinks[0])
    }
}
