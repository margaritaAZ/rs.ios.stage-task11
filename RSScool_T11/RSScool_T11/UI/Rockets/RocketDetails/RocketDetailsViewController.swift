//
//  RocketDetailsViewController.swift
//  RSScool_T11
//
//  Created by Маргарита Жучик on 11.09.21.
//

import UIKit

class RocketDetailsViewController: UIViewController {

    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var decriptionView: UIView!
    @IBOutlet weak var rocketDescription: UILabel!
    
    let backButton: UIButton = {
       let button = UIButton()
        let image = UIImage(named: "chevron.left")
        button.setImage(image?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .coral
        return button
    }()
    
    var rocket: RocketModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(backButton)
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: mainImageView.topAnchor, constant: 44),
            backButton.leadingAnchor.constraint(equalTo: mainImageView.leadingAnchor, constant: 10)
        ])
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        setRocketInfo()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setRocketInfo() {
        guard let rocketInfo = self.rocket else { return }
        mainImageView.image = rocketInfo.mainImage != nil ? rocketInfo.mainImage! : UIImage(named: "rocketImage")
//        mainImageView.image = UIImage(named: "rocketImage")
        nameLabel.text = rocketInfo.name
        rocketDescription.text = rocketInfo.description
    }
    
    @objc func backButtonTapped() {
        dismiss(animated: true, completion: {})
    }
    
    @IBAction func openWikipedia(_ sender: Any) {
        let wikipediaVC = WebViewController()
        wikipediaVC.modalPresentationStyle = .overFullScreen
        present(wikipediaVC, animated: true, completion: nil)
    }
}
