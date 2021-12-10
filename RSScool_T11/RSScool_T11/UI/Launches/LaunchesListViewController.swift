//
//  LaunchesListViewController.swift
//  RSScool_T11
//
//  Created by Маргарита Жучик on 13.09.21.
//

import UIKit

class LaunchesListViewController: CollectionViewController {
    private var dataSource = [LaunchModel]()
    private var loadService = LoadService()

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "LaunchCollectionViewCell", bundle: nil),
                                forCellWithReuseIdentifier: LaunchCollectionViewCell.reuseId)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadService.loadLaunches { [weak self] launchesList, error in
            guard let self = self else { return }
            DispatchQueue.main.async { [self] in
                if let launches = launchesList {
                    self.dataSource = launches
                    self.collectionView.reloadData()
                }
            }
        }
    }
    
    @objc override func sortItems() {
        
    }
    
    func loadImageForIndexPath(_ indexPath: IndexPath) {
        let launch = dataSource[indexPath.item]
        guard let imageUrl = launch.links.patch.small else {return}
        loadService.loadImageForURL(imageUrl) {[weak self] image in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.dataSource[indexPath.item].patchImage = image
                self.collectionView .reloadItems(at: [indexPath])
            }
        }
    }

}

extension LaunchesListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    // MARK: UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LaunchCollectionViewCell.reuseId, for: indexPath) as! LaunchCollectionViewCell
        
        let launch = dataSource[indexPath.item]
        if launch.patchImage == nil {
            loadImageForIndexPath(indexPath)
        }
        cell.configureWithItem(launch)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let launch = dataSource[indexPath.item]
        guard let imageUrl = launch.links.patch.small else {return}
        loadService.cancelDownloadingForURL(url: imageUrl)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    
    // MARK: UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 40, height: 145)
    }
}

