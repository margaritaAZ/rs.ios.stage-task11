//
//  CollectionViewController.swift
//  RSScool_T11
//
//  Created by Маргарита Жучик on 15.09.21.
//

import UIKit

class CollectionViewController: UIViewController {
        let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .queenBlue
        collection.translatesAutoresizingMaskIntoConstraints = false
        layout.minimumLineSpacing = 20
            layout.sectionInset = UIEdgeInsets(top: 30, left: 20, bottom: 30, right: 20)
        return collection
    }()
    
      lazy var sortButton = UIBarButtonItem(image: UIImage(named: "arrows"),
                                                  style: .plain,
                                                  target: self,
                                                  action: #selector(sortItems))
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .queenBlue
        navigationItem.rightBarButtonItem = sortButton
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

    }
    
    @objc func sortItems() {
    }
}
