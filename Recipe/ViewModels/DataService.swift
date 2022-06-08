//
//  DataService.swift
//  Recipe
//
//  Created by Jianhui Ye on 2022/6/7.
//

import Foundation

class DataService {
    static func getRecipes() -> [Recipe] {
        let path = Bundle.main.path(forResource: "recipes", ofType: "json")
        if path == nil {
            return []
        }
        let url = URL(fileURLWithPath: path!)
        do{
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let recipes: [Recipe] = try decoder.decode([Recipe].self, from: data)
            recipes.forEach { recipes in
                recipes.id = UUID()
                let ingredients = recipes.ingredients
                if ingredients.isEmpty {
                    return
                }
                ingredients.forEach { ingredient in
                    ingredient.id = UUID()
                }
            }
            return recipes
        } catch {
            print(error)
        }
        return []
    }
}
