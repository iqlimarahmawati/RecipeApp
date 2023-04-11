//
//  MealsModel.swift
//  RecipeApp
//
//  Created by Iqlima Rahmawati 10/04/23.
//

import Foundation
struct RecipeModel: Codable {
    var Meals : MealsModel
}

struct MealsModel: Codable {
    var idMeal: String
    var strMeal: String
    var strCategory: String
    var strArea: String
    var strInstructions : String
    var strMealThumb : String
    
    var strIngredient1: String
    var strIngredient2: String
    var strIngredient3: String
    var strIngredient4: String
    var strIngredient5: String
    var strIngredient6: String
    var strIngredient7: String
    var strIngredient8: String
    var strIngredient9: String
    
    var strMeasure1: String
    var strMeasure2: String
    var strMeasure3: String
    var strMeasure4: String
    var strMeasure5: String
    var strMeasure6: String
    var strMeasure7: String
    var strMeasure8: String
    var strMeasure9: String


}
