//
//  ProfileTableViewCell.swift
//  RecipeApp
//
//  Created by Iqlima Rahmawati on 07/05/23.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    static let identifier = "ProfileTableViewCell"
    
    @IBOutlet weak var editLabel: UILabel!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var cellView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
//        cellView.layer.cornerRadius = 15
//        cellView.layer.borderColor = UIColor.orange.cgColor
//        cellView.layer.borderWidth = 1
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
