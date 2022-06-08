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
        
        func getPortion(recipeServings:Int, targetServings:Int) -> String {
            
            var portion = ""
            var numerator = self.num ?? 1
            var denominator = self.denom ?? 1
            var wholePortions = 0
            
            if self.num != nil {
                
                // Get a single serving size by multiplying denominator by the recipe servings
                denominator *= recipeServings
                
                // Get target portion by multiplying numerator by target servings
                numerator *= targetServings
                
                // Reduce fraction by greatest common divisor
                let divisor = Rational.greatestCommonDivisor(numerator, denominator)
                numerator /= divisor
                denominator /= divisor
                
                // Get the whole portion if numerator > denominator
                if numerator >= denominator {
                    
                    // Calculated whole portions
                    wholePortions = numerator / denominator
                    
                    // Calculate the remainder
                    numerator = numerator % denominator
                    
                    // Assign to portion string
                    portion += String(wholePortions)
                }
                
                // Express the remainder as a fraction
                if numerator > 0 {
                    
                    // Assign remainder as fraction to the portion string
                    portion += wholePortions > 0 ? " " : ""
                    portion += "\(numerator)/\(denominator)"
                }
                
            }
            
            if var unit = self.unit {
                
                // If we need to pluralize
                if wholePortions > 1 {
                    
                    // Calculate appropriate suffix
                    if unit.suffix(2) == "ch" {
                        unit += "es"
                    }
                    else if unit.suffix(1) == "f" {
                        unit = String(unit.dropLast())
                        unit += "ves"
                    }
                    else {
                        unit += "s"
                    }
                }
                
                portion += self.num == nil && self.denom == nil ? "" : " "
                
                return portion + unit
            }
            
            return portion
        }
        
    }
}

