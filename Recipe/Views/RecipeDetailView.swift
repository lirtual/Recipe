//
//  RecipeDetailView.swift
//  Recipe
//
//  Created by Jianhui Ye on 2022/6/7.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe:Recipe
    @State var selectedIndex:Int = 2
    let servingSelections:[Int] = [2, 4, 6, 8]
    
    var body: some View {
        GeometryReader { geo in
            ScrollView{
                VStack (alignment: .leading){
                    Image(recipe.image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: geo.size.width, height: 280)
                        .clipped()
                    
                    HStack {
                        Text("Select your serving size: ")
                        Picker("Picker", selection: $selectedIndex){
                            ForEach(servingSelections, id: \.self){ servingSelection in
                                Text(String(servingSelection)).tag(servingSelection)
                            }
                        }
                        .pickerStyle(.segmented)
                        .frame(width: 150)
                    }.padding()
                    
                    VStack (alignment: .leading){
                        Text("Ingredients")
                            .font(.title2)
                            .bold()
                            .padding(.vertical , 5)
                        ForEach(recipe.ingredients) { ingredient in
                            Text(" ·  \(ingredient.getPortion(recipeServings: recipe.servings, targetServings: selectedIndex)) \(ingredient.name)")
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
