//
//  HomeView.swift
//  UAS_0706012010026
//
//  Created by SIFT - Telkom DBT Air 2 on 23/05/22.
//

import SwiftUI

struct HomeView: View {
    
    private let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    @State private var currentIndex = 0
    
    @StateObject var viewModeldrink = ViewModelDrink()
    
    var body: some View {
        ScrollView {
            VStack{
                
                //Tulisan Recommended Drinks
                HStack{
                    Text("Recommended Drinks")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                    Spacer()
                }
                
                //Carousel
                GeometryReader { proxy in
                    TabView(selection: $currentIndex) {
                        ForEach(1..<4) { num in
                            Image("Image\(num)")
                                .renderingMode(.original)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .cornerRadius(5)
                                .overlay(Color.black.opacity(0.15))
                                .tag(num)
                        }
                    }.tabViewStyle(PageTabViewStyle())
                        .clipShape(RoundedRectangle(cornerRadius: 0))
                        .frame(width: .infinity, height: 250)
                        .onReceive(timer, perform: { _ in
                            withAnimation{
                                currentIndex = currentIndex < 3 ? currentIndex + 1 : 0
                            }
                        })
                }.frame(height: 250)
                    .overlay {
                        TextOverlay()
                    }
                
                //Tulisan Drink
                HStack{
                    Text("Drinks")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                    Spacer()
                }
                
                //Gambar Drink
                HStack{
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(alignment: .top, spacing: 0) {
                            ForEach(viewModeldrink.drink, id:\.self){ Drink in
                                HomeDrinkRow(drink: Drink)
                            }
                        }
                    }.onAppear(){
                        viewModeldrink.fetch()
                    }
                    .frame(height: 150)
                }
                
                //Tulisan Ingredients
                HStack{
                    Text("Ingredients")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                    Spacer()
                }
                
                //Gambar Ingredient
                HStack{
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(alignment: .top, spacing: 0) {
                            ForEach(1..<9) { num in
                                Image("Image-\(num)")
                                    .resizable()
                                    .frame(width: 155, height: 155)
                                    .cornerRadius(5)
                            }
                        }
                    }
                }.padding(.bottom, 40)
                
            }
        }
    }
}

//Text Cocktail di Carousel
struct TextOverlay: View {
    
    var gradient: LinearGradient {
        .linearGradient(
            Gradient(colors: [.black.opacity(0), .black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            gradient
            VStack(alignment: .leading) {
                Text("Cocktail")
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
