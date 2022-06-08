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
            VStack(alignment: .leading) {
                // MARK: Titile
                Text("All Recipes")
                    .font(.largeTitle)
                    .bold()
                
                ScrollView{
                    LazyVStack(alignment: .leading) {
                        ForEach(recipeModel.recipes){recipe in
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
                                    VStack (alignment: .leading) {
                                        Text(recipe.name)
                                            .foregroundColor(.black)
                                            .font(.headline)
                                            .padding(.bottom, 1)
                                        Text(recipe.getHighlightsString())
                                            .foregroundColor(.gray)
                                            .font(.caption)
                                    }
                                }
                            }
                            
                        }
                        .padding(.vertical, 5.0)
                    }
                }
            }
            .padding(/*@START_MENU_TOKEN@*/.all, 25.0/*@END_MENU_TOKEN@*/)
            .navigationBarHidden(true)
            
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
