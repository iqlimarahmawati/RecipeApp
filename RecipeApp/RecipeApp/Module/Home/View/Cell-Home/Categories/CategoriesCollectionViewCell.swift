//
//  CategoriesCollectionViewCell.swift
//  RecipeApp
//
//  Created by Iqlima Rahmawati on 11/04/23.
//

import UIKit

class CategoriesCollectionViewCell: UICollectionViewCell {
 
    static let identifier = "CategoriesCollectionViewCell"
 
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var categoriesImage: UIImageView!
    @IBOutlet weak var categoriesLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        cellView.layer.cornerRadius = 10
        categoriesImage.contentMode = .scaleAspectFit
        cellView.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        cellView.layer.cornerRadius = 15
    }

}
