//
//  ListAllMealsCollectionViewCell.swift
//  RecipeApp
//
//  Created by Phincon on 13/04/23.
//

import UIKit

class ListAllMealsCollectionViewCell: UICollectionViewCell {

    static let identifier = "ListAllMealsCollectionViewCell"
    
    @IBOutlet weak var cellViewListAllMeals: UIView!
    @IBOutlet weak var nameListAllMeals: UILabel!
    @IBOutlet weak var categoriesListAllMeals: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
    }

}
