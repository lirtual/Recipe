//
//  RecipeListView.swift
//  Recipe
//
//  Created by Jianhui Ye on 2022/6/7.
//

import SwiftUI

struct RecipeListView: View {
    @ObservedObject var recipeModel:RecipeModel
    
    init(){
        self.recipeModel = RecipeModel()
    }
    
    var body: some View {
        NavigationView{
            List(recipeModel.recipes){recipe in
                NavigationLink {
                    RecipeDetailView(recipe: recipe)
                } label: {
                    HStack(spacing: 20.0) {
                        Image(recipe.image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                            .clipped()
                            .cornerRadius(5)
                        Text(recipe.name)
                    }
                }

            }
            .navigationBarTitle("All Recipes")
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
