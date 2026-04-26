//
//  BadgeView.swift
//  DigitalTrust_Akshith
//
//  Created by akshith kumar on 25/04/26.
//

import UIKit

class BadgeView: UIView {
    
    private lazy var bgView: UIView = UIView()
    private lazy var label: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
    }
    
    private func configureView() {
        addSubview(bgView)
        bgView.addSubview(label)
        
        bgView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        setupConstraints()
        
        setupView()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            bgView.topAnchor.constraint(equalTo: topAnchor),
            bgView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bgView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bgView.bottomAnchor.constraint(equalTo: bottomAnchor),
            bgView.heightAnchor.constraint(equalToConstant: 24),
            
            label.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 5),
            label.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 12),
            label.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -12),
            label.bottomAnchor.constraint(equalTo: bgView.bottomAnchor, constant: -5)
        ])
    }
    
    private func setupView() {
        bgView.layer.cornerRadius = 4
        bgView.layer.borderWidth = 1
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.textAlignment = .center
    }
    
    func setBadge(text: String, bagdeColor: UIColor?, borderColor: UIColor?, textColor: UIColor?) {
        label.text = text
        label.textColor = textColor
        bgView.backgroundColor = bagdeColor
        bgView.layer.borderColor = borderColor?.cgColor
    }    
}
