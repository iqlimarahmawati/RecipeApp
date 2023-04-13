//
//  ListCategoriesCollectionViewCell.swift
//  RecipeApp
//
//  Created by Phincon on 13/04/23.
//

import UIKit

class ListCategoriesCollectionViewCell: UICollectionViewCell {

    static let identifier = "ListCategoriesCollectionViewCell"

    @IBOutlet weak var cellViewListCategories: UIView!
    @IBOutlet weak var listCategoriesImage: UIImageView!
    @IBOutlet weak var nameCategories: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

}
