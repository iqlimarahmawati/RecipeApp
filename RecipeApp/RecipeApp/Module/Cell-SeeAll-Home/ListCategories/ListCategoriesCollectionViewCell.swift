//
//  ListCategoriesCollectionViewCell.swift
//  RecipeApp
//
//  Created by Iqlima Rahmawati on 13/04/23.
//

import UIKit

class ListCategoriesCollectionViewCell: UICollectionViewCell {

    static let identifier = "ListCategoriesCollectionViewCell"

    @IBOutlet weak var cellListCategoriesView: UIView!
    @IBOutlet weak var listCategoriesImageView: UIImageView!
    @IBOutlet weak var nameCategoriesLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
