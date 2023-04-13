//
//  RandomMealsCollectionViewCell.swift
//  RecipeApp
//
//  Created by Iqlima Rahmawati on 12/04/23.
//

import UIKit

class RandomMealsCollectionViewCell: UICollectionViewCell {

    static let identifier = "RandomMealsCollectionViewCell"
    
    @IBOutlet weak var cellViewRandomMeals: UIView!
    @IBOutlet weak var randomMealsImage: UIImageView!
    @IBOutlet weak var nameRandomMeals: UILabel!
    @IBOutlet weak var categoriesRandomMeals: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        cellViewRandomMeals.layer.cornerRadius = 15
    }

}
