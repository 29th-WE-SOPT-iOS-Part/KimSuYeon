//
//  ChannelCollectionViewCell.swift
//  29th-Assignment-Youtube
//
//  Created by 김수연 on 2021/10/25.
//

import UIKit

class ChannelCollectionViewCell: UICollectionViewCell {
    static let identifier = "ChannelCollectionViewCell"

    @IBOutlet weak var channelImageView: UIImageView!
    @IBOutlet weak var channelNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
    
    func setData(channelData: ChannelData){
        channelImageView.image = channelData.makeChannelImage()
        channelNameLabel.text = channelData.channelName
    }
}

extension ChannelCollectionViewCell {
    func setUI() {
        channelNameLabel.textColor = UIColor(red: 0.376, green: 0.376, blue: 0.376, alpha: 1)
        channelNameLabel.font = UIFont(name: "SFProDisplay-Regular", size: 12)
    }
}
