//
//  RecipeDetailView.swift
//  Recipe
//
//  Created by Jianhui Ye on 2022/6/7.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe:Recipe
    
    var body: some View {
        GeometryReader { geo in
            ScrollView{
                VStack (alignment: .leading){
                    ZStack {
                        Image(recipe.image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: geo.size.width, height: 280)
                            .clipped()
                    }
                    
                    VStack (alignment: .leading){
                        Text("Ingredients")
                            .font(.title2)
                            .bold()
                            .padding(.vertical , 5)
                        ForEach(recipe.ingredients) { ingredient in
                            Text(" ·  " + ingredient.name)
                                .padding(.bottom , 1)
                        }
                        .padding(.horizontal, 5)
                        
                        Divider()
                        
                        Text("Directions")
                            .font(.title2)
                            .bold()
                            .padding(.vertical , 5)
                        ForEach(0 ..< recipe.directions.count , id: \.self) { index in
                            Text(String(index + 1) + ". " + recipe.directions[index])
                                .padding(.bottom , 1)
                        }
                        .padding(.horizontal, 5)
                    }.padding(.leading, 10)
                }
            }.navigationBarTitle(recipe.name)
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(recipe: RecipeModel().recipes[0])
    }
}
