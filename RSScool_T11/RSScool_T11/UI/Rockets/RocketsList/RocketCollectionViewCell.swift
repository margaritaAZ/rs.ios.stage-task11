//
//  RocketCollectionViewCell.swift
//  RSScool_T11
//
//  Created by Маргарита Жучик on 8.09.21.
//

import UIKit

class RocketCollectionViewCell: UICollectionViewCell {
    static let reuseId = "RocketCollectionViewCell"
    
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var firstLaunchLabel: UILabel!
    @IBOutlet weak var launchCostLabel: UILabel!
    @IBOutlet weak var successLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 20
        layer.shadowRadius = 6
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowColor = UIColor.black.withAlphaComponent(0.37).cgColor
    }
    
    func configureWithItem(_ rocket: RocketModel) {
        titleLabel.text = rocket.name
        let date = rocket.firstFlight
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM d, yyyy"
        firstLaunchLabel.text = dateFormatter.string(from: date)
        launchCostLabel.text = "\(rocket.costPerLaunch )$"
        successLabel.text = "\(rocket.successRatePct)%"
        mainImageView.image = rocket.mainImage != nil ? rocket.mainImage! : UIImage(named: "rocketImage")
    }
}
