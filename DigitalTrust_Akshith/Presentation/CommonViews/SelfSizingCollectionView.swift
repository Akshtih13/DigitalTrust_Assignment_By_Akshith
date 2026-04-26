//
//  SelfSizingCollectionView.swift
//  DigitalTrust_Akshith
//
//  Created by akshith kumar on 24/04/26.
//

import UIKit

class SelfSizingCollectionView: UICollectionView {

    override var intrinsicContentSize: CGSize {
         self.layoutIfNeeded()
        return self.contentSize
     }

     override var contentSize: CGSize {
         didSet{
             self.invalidateIntrinsicContentSize()
         }
     }

     override func reloadData() {
         super.reloadData()
         self.invalidateIntrinsicContentSize()
     }
}
