//
//  PopularIngredientsCollectionViewCell.swift
//  RecipeApp
//
//  Created by Iqlima Rahmawati on 13/04/23.
//

import UIKit

class PopularIngredientsCollectionViewCell: UICollectionViewCell {

    static let identifier = "PopularIngredientsCollectionViewCell"
   
    @IBOutlet weak var popularIngredientsImage: UIImageView!
    @IBOutlet weak var namePopularIngredients: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        popularIngredientsImage.backgroundColor = .white
    }

}
