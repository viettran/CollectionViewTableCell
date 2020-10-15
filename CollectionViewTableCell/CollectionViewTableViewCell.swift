//
//  CollectionViewTableViewCell.swift
//  CollectionViewTableCell
//
//  Created by Viet Tran on 10/14/20.
//

import UIKit

class CollectionViewTableViewCell: UITableViewCell {
    
    var collectionViewController: CollectionViewController!

    override func awakeFromNib() {
        super.awakeFromNib()
        initCollectionView()
    }
    
    private func initCollectionView() {
        
        collectionViewController = CollectionViewController(nibName: String(describing: CollectionViewController.self), bundle: nil)
        
        //  Need to update row height when collection view finishes its layout.
        collectionViewController.didLayoutAction = updateRowHeight
        
        contentView.addSubview(collectionViewController.view)
        collectionViewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionViewController.view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            collectionViewController.view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            collectionViewController.view.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionViewController.view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])

    }
    
    private func updateRowHeight() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView?.updateRowHeightsWithoutReloadingRows()
        }
    }
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        return collectionViewController.collectionView.contentSize
    }

}
