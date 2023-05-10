//
//  CountryCollectionViewCell.swift
//  RecipeApp
//
//  Created by Iqlima Rahmawati on 12/04/23.
//

import UIKit

class CountryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var countryView: UIView!
    
    static let identifier = "CountryCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        countryView.layer.borderColor = UIColor.orange.cgColor
        countryView.layer.borderWidth = 1
        countryView.layer.cornerRadius = 15
        countryView.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        
        
        countryLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }

}
