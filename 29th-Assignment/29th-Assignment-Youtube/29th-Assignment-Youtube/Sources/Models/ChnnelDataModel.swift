//
//  ChnnelDataModel.swift
//  29th-Assignment-Youtube
//
//  Created by 김수연 on 2021/10/25.
//

import UIKit

struct ChannelData{
    let channelImageName: String
    let channelName: String
    
    func makeChannelImage() -> UIImage? {
        return UIImage(named: channelImageName)
    }
}
