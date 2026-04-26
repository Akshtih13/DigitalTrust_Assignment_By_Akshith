//
//  EventsCollectionViewCell.swift
//  DigitalTrust_Akshith
//
//  Created by akshith kumar on 24/04/26.
//

import UIKit

class EventsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var gradiateColorImageView: UIImageView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    private func setupView() {
        bgView.backgroundColor = .white
        bgView.layer.cornerRadius = 8
        bgView.layer.borderWidth = 1
        bgView.layer.borderColor = UIColor(#colorLiteral(red: 0.8904106617, green: 0.9370467663, blue: 0.9212324023, alpha: 1)).cgColor
        bgView.setupBoarderShadow()
        
        gradiateColorImageView.layer.cornerRadius = 8
        
        titleLabel.textColor = UIColor(named: "primary_text_color")
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        
        subTitleLabel.textColor = UIColor(named: "secondary_text_color")
        subTitleLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    }
    
    func setupCell(_ data: InfoCard) {
        imageView.image = UIImage(named: data.icon)
        titleLabel.text = data.title
        subTitleLabel.text = data.description ?? ""
    }

}
