//
//  CategoriesCollectionViewCell.swift
//  RecipeApp
//
//  Created by Iqlima Rahmawati on 11/04/23.
//

import UIKit

class CategoriesCollectionViewCell: UICollectionViewCell {
 
    static let identifier = "CategoriesCollectionViewCell"

    @IBOutlet weak var categoriesImage: UIImageView!
    @IBOutlet weak var categoriesLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        contentView.backgroundColor = .blue
    }

}
