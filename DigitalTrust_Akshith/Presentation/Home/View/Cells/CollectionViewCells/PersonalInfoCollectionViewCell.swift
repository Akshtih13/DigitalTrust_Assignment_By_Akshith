//
//  PersonalInfoCollectionViewCell.swift
//  DigitalTrust_Akshith
//
//  Created by akshith kumar on 24/04/26.
//

import UIKit

class PersonalInfoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var imageBgView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var arrowImageView: UIImageView!
    @IBOutlet weak var subTitleView: UILabel!
    @IBOutlet weak var statusView: BadgeView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupCell()
    }
    
    private func setupCell() {
        bgView.backgroundColor = UIColor(#colorLiteral(red: 0.9648438096, green: 0.9648438096, blue: 0.9648438096, alpha: 1))
        bgView.layer.borderColor = UIColor(#colorLiteral(red: 0.9174805284, green: 0.9174805284, blue: 0.9174805284, alpha: 1)).cgColor
        bgView.layer.borderWidth = 1
        bgView.layer.cornerRadius = 8
        
        imageBgView.backgroundColor = UIColor(#colorLiteral(red: 0.9018554688, green: 0.9018554688, blue: 0.9018554688, alpha: 1))
        imageBgView.layer.cornerRadius = 8
        
        titleView.backgroundColor = .clear
        
        titleLable.textColor = UIColor(named: "primary_text_color")
        titleLable.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        
        arrowImageView.image = UIImage(named: "arrow_right")
        arrowImageView.tintColor = UIColor(named: "primary_text_color")
        
        subTitleView.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        subTitleView.textColor = UIColor(named: "secondary_text_color")
        
    }
    
    func setupCell(_ data: PersonalInfo) {
        imageView.image = UIImage(named: data.icon)
        titleLable.text = data.title
        subTitleView.text = data.date
        setupStatus(data.status.lowercased())
    }
    
    private func setupStatus(_ status: String) {
        guard let statusExtension = StatusTypeExtension(rawValue: status) else { print("Extension is Missing")
            return
        }
        let statusType = statusExtension.getStatusType()
        statusView.setBadge(text: status.capitalized, bagdeColor: UIColor(named: statusType.bgColor), borderColor: UIColor(named: statusType.borderColor), textColor: UIColor(named: statusType.textColor))
    }

}
