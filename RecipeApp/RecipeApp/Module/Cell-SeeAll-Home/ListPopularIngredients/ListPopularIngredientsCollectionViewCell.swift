//
//  ListPopularIngredientsCollectionViewCell.swift
//  RecipeApp
//
//  Created by Phincon on 13/04/23.
//

import UIKit

class ListPopularIngredientsCollectionViewCell: UICollectionViewCell {

    static let identifier = "ListPopularIngredientsCollectionViewCell"
    
    @IBOutlet weak var popularIngredientsImage: UIImageView!
    @IBOutlet weak var namePopularIngredientsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
