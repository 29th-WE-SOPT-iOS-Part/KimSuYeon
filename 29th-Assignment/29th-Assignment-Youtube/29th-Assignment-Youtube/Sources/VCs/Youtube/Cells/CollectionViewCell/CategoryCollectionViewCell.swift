//
//  CategoryCollectionViewCell.swift
//  29th-Assignment-Youtube
//
//  Created by 김수연 on 2021/10/25.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    static let identifier = "CategoryCollectionViewCell"
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                //select
                categoryLabel.layer.backgroundColor = UIColor(red: 0.376, green: 0.376, blue: 0.376, alpha: 1).cgColor
                categoryLabel.textColor = .white
            } else {
                //unselect
                categoryLabel.layer.backgroundColor = UIColor(red: 0.949, green: 0.949, blue: 0.949, alpha: 1).cgColor
                categoryLabel.textColor = .black
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setLabel()
    }
}

extension CategoryCollectionViewCell {
    func setLabel() {
        contentView.addSubview(categoryLabel)
        categoryLabel.textAlignment = .center
        categoryLabel.font = UIFont(name: "SFProDisplay-Regular", size: 14)
    
        categoryLabel.frame = CGRect(x: 0, y: 0, width: 46, height: 32)
        categoryLabel.layer.backgroundColor = UIColor(red: 0.949, green: 0.949, blue: 0.949, alpha: 1).cgColor
        categoryLabel.layer.cornerRadius = 16
        categoryLabel.layer.borderWidth = 1
        categoryLabel.layer.borderColor = UIColor(red: 0.854, green: 0.854, blue: 0.854, alpha: 1).cgColor
    }
    
    func setCategoryData(category: String) {
        categoryLabel.text = category
    }
}
