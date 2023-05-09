//
//  AllMealsCollectionViewCell.swift
//  RecipeApp
//
//  Created by Iqlima Rahmawati on 11/04/23.
//

import UIKit

class AllMealsCollectionViewCell: UICollectionViewCell {

static let identifier = "AllMealsCollectionViewCell"
    
    @IBOutlet weak var cellViewAllMeals: UIView!
    @IBOutlet weak var allMealsImage: UIImageView!
    @IBOutlet weak var strMeals: UILabel!
    @IBOutlet weak var strCategories: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        cellViewAllMeals.layer.cornerRadius = 20
        cellViewAllMeals.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        
        allMealsImage.contentMode = .scaleToFill
        allMealsImage.backgroundColor = #colorLiteral(red: 0.9218714833, green: 0.9334767461, blue: 0.9332726002, alpha: 1)
        allMealsImage.layer.cornerRadius = 10
//        allMealsImage.backgroundColor = .white
        
        strMeals.font = UIFont.boldSystemFont(ofSize: 15)
    }

}
