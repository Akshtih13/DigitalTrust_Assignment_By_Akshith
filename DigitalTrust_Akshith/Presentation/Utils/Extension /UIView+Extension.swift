//
//  UIView+Extension.swift
//  DigitalTrust_Akshith
//
//  Created by akshith kumar on 25/04/26.
//

import UIKit

extension UIView {
    func setupBoarderShadow(color: UIColor? = UIColor(named: "shadow_color")) {
        layer.masksToBounds = false
        layer.shadowRadius = 4
        layer.shadowOpacity = 0.4
        layer.shadowColor = color?.cgColor
        layer.shadowOffset = CGSize(width: 2, height: 2)
    }
}
