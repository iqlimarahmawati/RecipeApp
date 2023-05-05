//
//  ListPopularIngredientsCollectionViewCell.swift
//  RecipeApp
//
//  Created by Iqlima Rahmawati on 13/04/23.
//

import UIKit

class ListPopularIngredientsCollectionViewCell: UICollectionViewCell {

    static let identifier = "ListPopularIngredientsCollectionViewCell"
    
    @IBOutlet weak var popularIngredientsImage: UIImageView!
    @IBOutlet weak var namePopularIngredientsLabel: UILabel!
    @IBOutlet weak var cellListPopularView: UIView!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
