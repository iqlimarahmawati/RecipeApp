//
//  ListAllMealsCollectionViewCell.swift
//  RecipeApp
//
//  Created by Iqlima Rahmawati on 13/04/23.
//

import UIKit

class ListAllMealsCollectionViewCell: UICollectionViewCell {

    static let identifier = "ListAllMealsCollectionViewCell"
    
    @IBOutlet weak var cellViewListAllMeals: UIView!
    @IBOutlet weak var nameListAllMeals: UILabel!
    @IBOutlet weak var categoriesListAllMeals: UILabel!
    @IBOutlet weak var mealsImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        mealsImageView.contentMode = .scaleAspectFit
        mealsImageView.layer.cornerRadius = 20
        
        cellViewListAllMeals.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        cellViewListAllMeals.layer.cornerRadius = 15
        
    }

}
