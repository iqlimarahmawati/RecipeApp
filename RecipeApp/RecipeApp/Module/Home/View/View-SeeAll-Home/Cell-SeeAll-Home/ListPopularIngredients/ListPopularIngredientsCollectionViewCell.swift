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
        
        cellListPopularView.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        cellListPopularView.layer.cornerRadius = 15
        
        popularIngredientsImage.contentMode = .scaleAspectFit
    }
}
