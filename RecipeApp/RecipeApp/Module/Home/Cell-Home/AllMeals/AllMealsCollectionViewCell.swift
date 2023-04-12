//
//  AllMealsCollectionViewCell.swift
//  RecipeApp
//
//  Created by Iqlima Rahmawati on 11/04/23.
//

import UIKit

class AllMealsCollectionViewCell: UICollectionViewCell {

static let identifier = "AllMealsCollectionViewCell"
    
    @IBOutlet weak var allMealsImage: UIImageView!
    @IBOutlet weak var idMealsLabel: UILabel!
    @IBOutlet weak var strMeals: UILabel!
    @IBOutlet weak var strCategories: UILabel!
    @IBOutlet weak var strArea: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
