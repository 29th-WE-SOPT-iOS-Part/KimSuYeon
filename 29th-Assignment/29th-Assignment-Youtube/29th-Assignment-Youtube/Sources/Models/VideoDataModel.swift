//
//  VideoDataModel.swift
//  29th-Assignment-Youtube
//
//  Created by 김수연 on 2021/10/25.
//

import UIKit

struct VideoData{
    let thumbnailImageName: String
    let videoTitle: String
    let channelImageName: String
    
    let channelName: String
    let views: Int
    let uploadDate: String
    
    func makeThumbnailImage() -> UIImage? {
        return UIImage(named: thumbnailImageName)
    }
    
    func makeChannelImage() -> UIImage? {
        return UIImage(named: channelImageName)
    }
}
