//
//  PersonalInfoTableViewCell.swift
//  DigitalTrust_Akshith
//
//  Created by akshith kumar on 24/04/26.
//

import UIKit

class PersonalInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var bgview: UIView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var viewAllBtn: UIButton!
    @IBOutlet weak var collectionView: SelfSizingCollectionView!
    
    private var items: [PersonalInfo] = []
    var reloadData: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
        registerCells()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
        
    private func setupView() {
        
        self.backgroundColor = .clear
        self.selectionStyle = .none
        
        bgview.backgroundColor = UIColor(#colorLiteral(red: 0.9840924144, green: 0.98842448, blue: 0.9727836251, alpha: 1))
        bgview.layer.cornerRadius = 8
        bgview.layer.borderWidth = 1
        bgview.layer.borderColor = UIColor(named: "personal_info_border")?.cgColor
        bgview.setupBoarderShadow()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isScrollEnabled = false
        collectionView.backgroundColor = .clear
        
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        titleLabel.textColor = UIColor(named: "primary_text_color")
        
        viewAllBtn.setTitle("View All ", for: .normal)
        viewAllBtn.setImage(UIImage(named: "arrow_right"), for: .normal)
        viewAllBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        viewAllBtn.setTitleColor(UIColor(named: "secondary_text_color"), for: .normal)
        viewAllBtn.tintColor = UIColor(named: "secondary_text_color")
    }
    
    private func registerCells() {
        collectionView.register(PersonalInfoCollectionViewCell.self)
    }
    
    func setupCell(title: String, data: [PersonalInfo]) {
        titleLabel.text = title
        items = data
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            collectionView.reloadData()
            collectionView.layoutIfNeeded()
            reloadData?()
        }
    }
    
}

extension PersonalInfoTableViewCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: PersonalInfoCollectionViewCell = collectionView.dequeueReusableCell(indexPath)
        let data = items[indexPath.item]
        cell.setupCell(data)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.collectionView.contentSize.width
        return CGSize(width: width, height: 110)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
}
