//
//  toast.swift
//  RecipeApp
//
//  Created by Iqlima Rahmawati on 09/05/23.
//

import Foundation
import UIKit

extension UIViewController {

    public func showToast(message : String, font: UIFont, color: UIColor) {
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-200, width: 150, height: 50))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        toastLabel.textColor = color
        toastLabel.font = font
        toastLabel.textAlignment = .center
        toastLabel.numberOfLines = 0
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 8.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: { (isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
}
