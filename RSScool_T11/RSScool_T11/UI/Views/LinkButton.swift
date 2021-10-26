//
//  LinkButton.swift
//  RSScool_T11
//
//  Created by Маргарита Жучик on 13.09.21.
//

import UIKit

class LinkButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        customize()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        customize()
    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        customize()
//    }
    
    func customize() {
        let shadowLayer = CALayer()
        shadowLayer.cornerRadius = 20
        shadowLayer.shadowOpacity = 1
        shadowLayer.shadowRadius = 3
        shadowLayer.shadowOffset = CGSize(width: -1, height: -1)
        shadowLayer.shadowColor = UIColor.white.cgColor
        layer.addSublayer(shadowLayer)
        layer.cornerRadius = 20
        layer.shadowOpacity = 1
        layer.shadowRadius = 3
        layer.shadowOffset = CGSize(width: 1.5, height: 1.5)
        layer.shadowColor = #colorLiteral(red: 0.6823529412, green: 0.6823529412, blue: 0.7529411765, alpha: 1).withAlphaComponent(0.4).cgColor
        
        backgroundColor = #colorLiteral(red: 0.9764705882, green: 0.9764705882, blue: 0.9764705882, alpha: 1)
        
        let image = UIImage(named: "link")
        setImage(image?.withRenderingMode(.alwaysTemplate), for: .normal)
    }
    
}
