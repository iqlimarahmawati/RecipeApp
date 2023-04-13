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
        
        cellViewAllMeals.layer.cornerRadius = 10
        
        allMealsImage.contentMode = .scaleAspectFit
//        allMealsImage.backgroundColor = .white
    }

}
