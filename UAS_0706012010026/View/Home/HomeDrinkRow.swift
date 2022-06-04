//
//  HomeDrinkRow.swift
//  UAS_0706012010026
//
//  Created by SIFT - Telkom DBT Air 2 on 04/06/22.
//

import SwiftUI

struct HomeDrinkRow: View {
    
    var drink: Drink

    var body: some View {
        URLImageHomeDrinkRow(urlString: drink.strDrinkThumb)
    }
}

struct URLImageHomeDrinkRow: View {
    let urlString: String
    @State var data: Data?
    
    var body: some View {
        if let data = data, let uiimage = UIImage(data: data) {
            Image(uiImage: uiimage)
                .resizable()
                .frame(width: 140, height: 140)
                .cornerRadius(10)
                .padding(.leading)
        }
        else {
            Image("")
                .resizable()
                .frame(width: 140, height: 140)
                .cornerRadius(10)
                .padding(.leading)
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


struct HomeDrinkRow_Previews: PreviewProvider {
    static var previews: some View {
        HomeDrinkRow(drink: drinks[0])
        HomeDrinkRow(drink: drinks[1])
    }
}
