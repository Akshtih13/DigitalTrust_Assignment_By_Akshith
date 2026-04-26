//
//  ProfileTableViewCell.swift
//  DigitalTrust_Akshith
//
//  Created by akshith kumar on 24/04/26.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileInfoView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var contactInfoLabel: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var accountTypeView: BadgeView!
    @IBOutlet weak var statusView: BadgeView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setupView() {
        self.selectionStyle = .none
        self.backgroundColor = .clear
        profileInfoView.backgroundColor = .clear
        profileImage.layer.cornerRadius = 5
        profileImage.layer.borderWidth = 1
        profileImage.layer.borderColor = UIColor(named: "personal_info_bg")?.cgColor
        profileImage.setupBoarderShadow()
        
        bgView.backgroundColor = UIColor(named: "personal_info_bg")
        bgView.setupBoarderShadow()
        bgView.layer.cornerRadius = 8
        bgView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        bgView.layer.masksToBounds = true
        
        nameLabel.textColor = UIColor(named: "primary_text_color")
        nameLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        
        contactInfoLabel.textColor = UIColor(named: "secondary_text_color")
        contactInfoLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
       
    }
    
    func setupCell(_ data: UserInfo?) {
        guard let data else { return }
        profileImage.image = UIImage(named: data.profileImage)
        nameLabel.text = data.name
        attributedString(text1: "Mobile ", text2: data.mobile)
        accountTypeView.setBadge(text: "Account Type", bagdeColor: UIColor(#colorLiteral(red: 0.8115236759, green: 0.8115233779, blue: 0.8034749627, alpha: 1)), borderColor: UIColor(#colorLiteral(red: 0.7646484375, green: 0.7646484375, blue: 0.7646484375, alpha: 1)), textColor: UIColor(named: "primary_text_color"))
        statusView.setBadge(text: "Status", bagdeColor: UIColor(named: StatusType.active.bgColor), borderColor: UIColor(named: StatusType.active.borderColor), textColor: UIColor(named: StatusType.active.textColor))
    }
    
    private func attributedString(text1: String, text2: String) {
        let color = UIColor(named: "secondary_text_color")
        let normalAttributes = [NSAttributedString.Key.foregroundColor: color, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: .light)]
        let otherAttributes = [NSAttributedString.Key.foregroundColor: color, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .regular)]
        let part1 = NSMutableAttributedString(string: text1, attributes: normalAttributes as [NSAttributedString.Key : Any])
        let part2 = NSMutableAttributedString(string: text2, attributes: otherAttributes as [NSAttributedString.Key : Any])
        let combination = NSMutableAttributedString()
        combination.append(part1)
        combination.append(part2)
        contactInfoLabel.attributedText = combination
    }
}
