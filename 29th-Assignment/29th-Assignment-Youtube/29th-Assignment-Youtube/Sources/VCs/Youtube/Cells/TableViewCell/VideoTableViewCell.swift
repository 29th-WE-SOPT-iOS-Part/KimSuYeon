//
//  VideoTableViewCell.swift
//  29th-Assignment-Youtube
//
//  Created by 김수연 on 2021/10/25.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
    static let identifier = "VideoTableViewCell"
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var channelImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var moreMenuButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(videoData: VideoData){
        thumbnailImageView.image = videoData.makeThumbnailImage()
        channelImageView.image = videoData.makeChannelImage()
        titleLabel.text = videoData.videoTitle
        descriptionLabel.text = "\(videoData.channelName) · 조회수 \(videoData.views)만회 ·  \(videoData.uploadDate) 전"
    }
    
}

extension VideoTableViewCell {
    func setUI() {
        titleLabel.font = UIFont(name: "SFProDisplay-Regular", size: 15)
        titleLabel.numberOfLines = 0
        
        descriptionLabel.textColor = UIColor(red: 0.376, green: 0.376, blue: 0.376, alpha: 1)
        descriptionLabel.font = UIFont(name: "SFProDisplay-Regular", size: 13)
    }
}
