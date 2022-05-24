//
//  HomeView.swift
//  UAS_0706012010026
//
//  Created by SIFT - Telkom DBT Air 2 on 23/05/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            HStack{
                Text("Recomended Drinks")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                Spacer()
            }
            
            Image("DryMartini")
                .resizable()
                .aspectRatio(3 / 2, contentMode: .fit)
                .overlay {
                    TextOverlay()
                }
            
            HStack{
                Text("Drinks")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding()
                Spacer()
            }
            
            HStack{
                
                Image("WhiskeySour")
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(5)
                
                Image("DryMartini")
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(5)
                
                Image("Margarita")
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(5)
            }
            
            HStack{
                Text("Ingredients")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding()
                Spacer()
            }
            
            HStack{
                Image("WhiskeySour")
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(5)
                
                Image("DryMartini")
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(5)
                
                Image("Margarita")
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(5)
            }
            Spacer()
        }
    }
}

struct TextOverlay: View {
    
    var gradient: LinearGradient {
        .linearGradient(
            Gradient(colors: [.black.opacity(0.6), .black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            gradient
            VStack(alignment: .leading) {
                Text("Dry Martini")
                    .font(.title2)
                    .bold()
            }
            .padding()
        }
        .foregroundColor(.white)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
