//
//  LaunchCollectionViewCell.swift
//  RSScool_T11
//
//  Created by Маргарита Жучик on 15.09.21.
//

import UIKit

class LaunchCollectionViewCell: UICollectionViewCell {
    static let reuseId = "LaunchCell"

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var upcomingLabel: UIButton!
    @IBOutlet weak var flightNumberLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 15
        layer.shadowRadius = 6
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowColor = UIColor.black.withAlphaComponent(0.37).cgColor
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addShadows(for: upcomingLabel)
        addShadows(for: flightNumberLabel)
    }
}

extension LaunchCollectionViewCell {
    func configureWithItem(_ launch: LaunchModel) {
        nameLabel.text = launch.name
        let date = launch.dateUtc
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM d, yyyy"
        dateLabel.text = dateFormatter.string(from: date)
        var image = UIImage(named: "clock")
        if launch.upcoming {
            image = UIImage(named: "checkmark.circle")
        }
        upcomingLabel.setImage(image?.withRenderingMode(.alwaysTemplate), for: .normal)
        flightNumberLabel.text = "# \(launch.flightNumber)"
        imageView.image = launch.patchImage != nil ? launch.patchImage! : UIImage(named: "shuttle")
    }
    
    func addShadows(for view: UIView) {
        let shadowView = UIView()
        shadowView.layer.name = "shadowView"
        shadowView.frame = view.frame
        shadowView.layer.borderWidth = 1
        shadowView.layer.cornerRadius = view.layer.cornerRadius
        view.addSubview(shadowView)

        let perimeterShadow = CALayer()

        perimeterShadow.name = "perimeterShadow"

        perimeterShadow.frame = view.bounds
        perimeterShadow.shadowColor = UIColor.black.cgColor
        perimeterShadow.shadowRadius = 1.5
        perimeterShadow.shadowOpacity = 1
        perimeterShadow.shadowOffset = CGSize(width: 1.5, height: 1.5)
//        perimeterShadow.needsDisplayOnBoundsChange = true
        perimeterShadow.cornerRadius = view.layer.cornerRadius
//        perimeterShadow.backgroundColor = UIColor.spaceWhite.cgColor
        shadowView.layer.insertSublayer(perimeterShadow, at: 0)
    }
    
    func setupShadows() {
        upcomingLabel.layer.cornerRadius = upcomingLabel.bounds.height/2
        upcomingLabel.layer.borderColor = UIColor.black.cgColor
        let shadowLayer1 = CALayer()
        shadowLayer1.shadowOpacity = 1
        shadowLayer1.shadowColor = UIColor(red: 0.682, green: 0.682, blue: 0.753, alpha: 0.4).cgColor
        shadowLayer1.shadowRadius = 1.5
        shadowLayer1.shadowOffset = CGSize(width: 1.5, height: 1.5)
        let shadowLayer2 = CALayer()
        shadowLayer2.shadowColor = UIColor.white.cgColor
        shadowLayer2.shadowOpacity = 1
        shadowLayer2.shadowRadius = 2
        shadowLayer2.shadowOffset = CGSize(width: -1, height: -1)
        upcomingLabel.layer.addSublayer(shadowLayer1)
        upcomingLabel.layer.addSublayer(shadowLayer2)
        upcomingLabel.backgroundColor = .spaceWhite
    }
}
