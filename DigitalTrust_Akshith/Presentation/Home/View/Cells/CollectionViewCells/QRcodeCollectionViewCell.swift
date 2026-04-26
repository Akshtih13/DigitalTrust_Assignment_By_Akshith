//
//  QRcodeCollectionViewCell.swift
//  DigitalTrust_Akshith
//
//  Created by akshith kumar on 24/04/26.
//

import UIKit

class QRcodeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var imageBgView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
   private func setupView() {
       self.backgroundColor = .clear
       bgView.backgroundColor = .clear
       
       imageBgView.backgroundColor = .white
       imageBgView.layer.borderWidth = 1
       imageBgView.layer.borderColor = UIColor(#colorLiteral(red: 0.8823242188, green: 0.8823242188, blue: 0.8823242188, alpha: 1)).cgColor
       imageBgView.layer.cornerRadius = imageBgView.frame.height / 2
       imageBgView.setupBoarderShadow()
       
       titleLabel.textColor = UIColor(#colorLiteral(red: 0.08630368859, green: 0.08630368859, blue: 0.08630368859, alpha: 1))
       titleLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
       titleLabel.textAlignment = .center
    }
    
    func setupCell(_ data: InfoCard) {
        imageView.image = UIImage(named: data.icon)
        titleLabel.text = data.title
    }

}
