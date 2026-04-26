//
//  EventsTableViewCell.swift
//  DigitalTrust_Akshith
//
//  Created by akshith kumar on 25/04/26.
//

import UIKit

class EventsTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: SelfSizingCollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    private var items: [InfoCard] = []
    var reloadData: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
        registerCells()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setupView() {
        self.backgroundColor = .clear
        self.selectionStyle = .none
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.isScrollEnabled = true
        
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.pageIndicatorTintColor = .lightGray
        
    }
    
    private func registerCells() {
        collectionView.register(EventsCollectionViewCell.self)
    }
    
    
    func setupCell(_ data: [InfoCard]) {
        items = data
        pageControl.numberOfPages = data.count
        pageControl.currentPage = 0
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            reloadData?()
            collectionView.reloadData()
            collectionView.layoutIfNeeded()
        }
    }
}

extension EventsTableViewCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: EventsCollectionViewCell = collectionView.dequeueReusableCell(indexPath)
        let data = items[indexPath.row]
        cell.setupCell(data)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.collectionView.frame.width
        return CGSize(width: width, height: 177)
    }
    
}

extension EventsTableViewCell {

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = Int(scrollView.contentOffset.x / scrollView.frame.width)
        pageControl.currentPage = page
    }
}
