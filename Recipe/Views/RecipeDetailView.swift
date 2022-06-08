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
                    
                    VStack (alignment: .leading){
                        Text(recipe.name)
                            .font(Font.custom("Avenir Heavy", size: 24))
                            .bold()
                        
                        HStack {
                            Text("Select your serving size: ")
                                .font(Font.custom("Avenir", size: 16))
                            Picker("Picker", selection: $selectedIndex){
                                ForEach(servingSelections, id: \.self){ servingSelection in
                                    Text(String(servingSelection))
                                        .font(Font.custom("Avenir", size: 14))
                                        .tag(servingSelection)
                                }
                            }
                            .pickerStyle(.segmented)
                            .frame(width: 150)
                        }
                        
                        VStack (alignment: .leading){
                            Text("Ingredients")
                                .font(Font.custom("Avenir Heavy", size: 20))
                                .padding(.vertical , 5)
                            ForEach(recipe.ingredients) { ingredient in
                                Text(" ·  \(ingredient.getPortion(recipeServings: recipe.servings, targetServings: selectedIndex)) \(ingredient.name)")
                                    .font(Font.custom("Avenir", size: 14))
                                    .padding(.bottom , 1)
                            }
                            
                            Divider()
                            
                            Text("Directions")
                                .font(Font.custom("Avenir Heavy", size: 20))
                                .padding(.vertical , 5)
                            ForEach(0 ..< recipe.directions.count , id: \.self) { index in
                                Text(String(index + 1) + ". " + recipe.directions[index])
                                    .font(Font.custom("Avenir", size: 14))
                                    .padding(.bottom , 1)
                            }
                            .padding(.horizontal, 5)
                        }
                    }
                    .padding()
                }
            }
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(recipe: RecipeModel().recipes[0])
    }
}
