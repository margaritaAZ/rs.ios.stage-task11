//
//  RocketsListViewController.swift
//  RSScool_T11
//
//  Created by Маргарита Жучик on 8.09.21.
//

import UIKit

enum SortOrder {
    case firstLaunch
    case launchCost
    case successRate
}

class RocketsListViewController: CollectionViewController {

    private var rocketService = LoadService()
    private var dataSource = [RocketModel]()
    let transition = Animator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib(nibName: "RocketCollectionViewCell", bundle: nil),
                                forCellWithReuseIdentifier: RocketCollectionViewCell.reuseId)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        rocketService.loadRockets { [weak self] rocketList, error in
            guard let self = self else { return }
            DispatchQueue.main.async { [self] in
                if let rockets = rocketList {
                    self.dataSource = rockets
                    self.collectionView.reloadData()
                }
            }
        }
    }
    
    @objc override func sortItems() {
        let alertController = UIAlertController(title: nil, message: "Choose your option", preferredStyle: .actionSheet)
        alertController.view.tintColor = .coral
        //        let message = NSMutableAttributedString(string: "Choose your option", attributes: [.font : UIFont.roboto(13, .medium), .foregroundColor: UIColor.slateGray])
        //        alertController.setValue(message, forKey: "attributedMessage")
        
        let firstLaunchAction = UIAlertAction(title: "First launch", style: .default) {
            [self] alert in sort(order: .firstLaunch)
        }
        let launchCostAction = UIAlertAction(title: "Launch cost", style: .default){
            [self] alert in sort(order: .launchCost)
        }
        let successRateAction = UIAlertAction(title: "Success rate", style: .default){
            [self] alert in sort(order: .successRate)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        cancelAction.setValue(UIColor(red: 0.922, green: 0.341, blue: 0.341, alpha: 1), forKey: "titleTextColor")
        
        alertController.addAction(firstLaunchAction)
        alertController.addAction(launchCostAction)
        alertController.addAction(successRateAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
        
    }
}

// MARK: Private interface
private extension RocketsListViewController {
    func loadImageForIndexPath(_ indexPath: IndexPath) {
        let rocket = dataSource[indexPath.item]
        guard let imageUrl = rocket.flickrImages?.first else {return}
        rocketService.loadImageForURL(imageUrl) {[weak self] image in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.dataSource[indexPath.item].mainImage = image
                self.collectionView .reloadItems(at: [indexPath])
            }
        }
    }
    
    func sort(order: SortOrder) {
        switch order {
        case .firstLaunch:
            dataSource.sort {
                $0.firstFlight > $1.firstFlight
            }
        case .launchCost:
            dataSource.sort {
                $0.costPerLaunch > $1.costPerLaunch
            }
        case .successRate:
            dataSource.sort {
                $0.successRatePct > $1.successRatePct
            }
        }
        collectionView.reloadData()
    }
    
    func presentDetailsViewController(with data: RocketModel) {
        let rocketDetailsVC = RocketDetailsViewController()
//        rocketDetailsVC.transitioningDelegate = self
        rocketDetailsVC.rocket = data
        rocketDetailsVC.modalPresentationStyle = .overFullScreen
        present(rocketDetailsVC, animated: true, completion: nil)
    }
}

extension RocketsListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    // MARK: UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RocketCollectionViewCell.reuseId, for: indexPath) as! RocketCollectionViewCell
        
        let rocket = dataSource[indexPath.item]
        if rocket.mainImage == nil {
            loadImageForIndexPath(indexPath)
        }
        cell.configureWithItem(rocket)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let rocket = dataSource[indexPath.item]
        guard let imageUrl = rocket.flickrImages?.first else {
            return
        }
        rocketService.cancelDownloadingForURL(url: imageUrl)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presentDetailsViewController(with: dataSource[indexPath.item])
    }
    
    // MARK: UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 40, height: 360)
    }
}

// MARK: UIViewControllerTransitioningDelegate
//extension RocketsListViewController: UIViewControllerTransitioningDelegate {
//    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        guard
//            let selectedIndexPathCell = collectionView.indexPathsForSelectedItems?.first,
//            let selectedCell = collectionView.cellForItem(at: selectedIndexPathCell)
//            as? RocketCollectionViewCell,
//          let selectedCellSuperview = selectedCell.superview
//          else {
//            return nil
//        }
//
//        transition.originFrame = selectedCellSuperview.convert(selectedCell.frame, to: nil)
//        transition.originFrame = CGRect(
//          x: transition.originFrame.origin.x + 20,
//          y: transition.originFrame.origin.y + 20,
//          width: transition.originFrame.size.width - 40,
//          height: transition.originFrame.size.height - 40
//        )
//
//        transition.presenting = true
////        selectedCell.shadowView.isHidden = true
//        return transition
//    }
//
//    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        nil
//    }
//}
