//
//  CollectionViewController.swift
//  CollectionViewTableCell
//
//  Created by Viet Tran on 10/14/20.
//

import UIKit

class CollectionViewController: UICollectionViewController {
    
    //  Set this action during initialization to get a callback when the collection view finishes its layout.
    //  To prevent infinite loop, this action should be called only once. Once it is called, it resets itself
    //  to nil.
    var didLayoutAction: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView.register(UICollectionViewCell.self,
                                     forCellWithReuseIdentifier: String(describing: UICollectionViewCell.self))
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        didLayoutAction?()
        didLayoutAction = nil   //  Call only once
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: UICollectionViewCell.self), for: indexPath)
        cell.backgroundColor = .lightGray
    
        return cell
    }
}
