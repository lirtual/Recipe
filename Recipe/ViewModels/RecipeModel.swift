//
//  RecipeModel.swift
//  Recipe
//
//  Created by Jianhui Ye on 2022/6/7.
//

import Foundation

class RecipeModel : ObservableObject {
    @Published var recipes:[Recipe]
    
    init(){
        self.recipes = DataService.getRecipes()
    }
}
