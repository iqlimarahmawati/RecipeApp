//
//  PopularIngredientsCollectionViewCell.swift
//  RecipeApp
//
//  Created by Iqlima Rahmawati on 13/04/23.
//

import UIKit

class PopularIngredientsCollectionViewCell: UICollectionViewCell {

    static let identifier = "PopularIngredientsCollectionViewCell"

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var popularIngredientsImage: UIImageView!
    @IBOutlet weak var namePopularIngredients: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        popularIngredientsImage.backgroundColor = .white
        
        cellView.layer.borderColor = UIColor.orange.cgColor
        cellView.layer.borderWidth = 1
        cellView.layer.cornerRadius = 10
    }

}
