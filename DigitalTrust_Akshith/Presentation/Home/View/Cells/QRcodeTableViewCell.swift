//
//  QRcodeTableViewCell.swift
//  DigitalTrust_Akshith
//
//  Created by akshith kumar on 24/04/26.
//

import UIKit

class QRcodeTableViewCell: UITableViewCell {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var walletImageView: UIImageView!
    @IBOutlet weak var bgWalletView1: UIView!
    @IBOutlet weak var bgWalletView2: UIView!
    @IBOutlet weak var collectionView: SelfSizingCollectionView!
    @IBOutlet weak var qrBgImageView: UIImageView!
    @IBOutlet weak var handleView: UIView!
    @IBOutlet weak var qrCodeImageView: UIImageView!
    @IBOutlet weak var qrCodeBtn: UIButton!
    @IBOutlet weak var collectionViewHeightConstrains: NSLayoutConstraint!
    @IBOutlet weak var qrBgImageViewHeightConstrain: NSLayoutConstraint!
    @IBOutlet weak var stackView: UIStackView!
    
    private var items: [InfoCard] = []
    private var expanded: Bool = true
    var didClickOnQRCode: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
        registerCells()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func registerCells() {
        collectionView.register(QRcodeCollectionViewCell.self)
    }
    
    private func setupView() {
        self.selectionStyle = .none
        self.backgroundColor = .clear
        
        bgView.setupBoarderShadow()
        
        walletImageView.image = UIImage(named: "Rectangle36567")
        bgWalletView1.backgroundColor = UIColor(named: "wallet_bg_1")
        bgWalletView2.backgroundColor = UIColor(named: "wallet_bg_2")
        
        bgWalletView1.layer.cornerRadius = 16
        bgWalletView1.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        bgWalletView1.layer.masksToBounds = true
        
        qrBgImageView.layer.cornerRadius = 8
        qrBgImageView.image = UIImage(named: "qrcode_bg")
        qrBgImageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        qrBgImageView.layer.masksToBounds = true
        
        qrCodeImageView.image = UIImage(named: "qrcode")
        qrCodeImageView.layer.cornerRadius = 8
        qrCodeImageView.setupBoarderShadow()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isScrollEnabled = false
        collectionView.backgroundColor = .clear
        
        handleView.layer.cornerRadius = 4
        
        qrBgImageViewHeightConstrain.constant = 277
        stackView.spacing = 16
    }
    
    func setupCell(_ data: [InfoCard]) {
        items = data
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            collectionView.reloadData()
            collectionView.layoutIfNeeded()
        }
    }
    
    @IBAction func qrCodeBtnAction(_ sender: UIButton) {
        expanded.toggle()
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            qrCodeConstrains()
            self.didClickOnQRCode?()
        }
    }
    
    func qrCodeConstrains() {
        UIView.animate(withDuration: 0.3) { [weak self] in
            guard let self else { return }
            qrBgImageViewHeightConstrain.constant = expanded ? 277 : 80
            stackView.spacing = expanded ? 16 : 2
        }
    }
    
}

extension QRcodeTableViewCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: QRcodeCollectionViewCell = collectionView.dequeueReusableCell(indexPath)
        let data = items[indexPath.item]
        cell.setupCell(data)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let totalWidth = collectionView.bounds.width - (collectionView.contentInset.left + collectionView.contentInset.right) - 16
        let itemWidth = totalWidth / 3
        return CGSize(width: itemWidth, height: 89)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
       8
    }
}
