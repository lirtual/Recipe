//
//  Recipe.swift
//  Recipe
//
//  Created by Jianhui Ye on 2022/6/7.
//

import Foundation

class Recipe: Identifiable, Decodable{
    var id: UUID?
    var name:String
    var featured:Bool
    var image:String
    var description:String
    var prepTime:String
    var cookTime:String
    var totalTime:String
    var servings:Int
    var ingredients:[Ingredient]
    var directions:[String]
    var highlights: [String]
    
    func getHighlightsString() -> String {
        var highlightsString = ""
        if self.highlights.isEmpty {
            return highlightsString
        }
        for index in 0 ..< highlights.count {
            highlightsString.append(contentsOf: highlights[index])
            if index < highlights.count - 1 {
                highlightsString.append(contentsOf: ", ")
            }
        }
        return highlightsString
    }
    
    class Ingredient: Identifiable, Decodable {
        var id: UUID?
        var name:String
        var num:Int?
        var unit:String?
        var denom:Int?
    }
}
    
