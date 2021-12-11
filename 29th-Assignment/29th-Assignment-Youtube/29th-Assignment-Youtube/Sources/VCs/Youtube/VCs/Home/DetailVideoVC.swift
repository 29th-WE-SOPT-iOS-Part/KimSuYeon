//
//  DetailVideoVC.swift
//  29th-Assignment-Youtube
//
//  Created by 김수연 on 2021/12/12.
//

import UIKit

import SkeletonView

class DetailVideoVC: UIViewController {
    static let identifier = "DetailVideoVC"

    @IBOutlet weak var detailVideoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var detailButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        //setSkeleton()
    }
    
    @IBAction func backButtonDidTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

}

extension DetailVideoVC {
    func setUI() {
        detailVideoImageView.contentMode = .scaleToFill
        titleLabel.font = UIFont(name: "SFProDisplay-Regular", size: 15)
        titleLabel.numberOfLines = 0

        descriptionLabel.textColor = UIColor(red: 0.376, green: 0.376, blue: 0.376, alpha: 1)
        descriptionLabel.font = UIFont(name: "SFProDisplay-Regular", size: 13)
    }

    func setSkeleton() {

        self.titleLabel.linesCornerRadius = 5
        self.descriptionLabel.linesCornerRadius = 5

        self.titleLabel.numberOfLines = 0
        self.descriptionLabel.numberOfLines = 0

        view.showAnimatedSkeleton()

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.view.stopSkeletonAnimation()
            self?.view.hideSkeleton(reloadDataAfter: true)
        }
        
    }
}
