//
//  HomeVideoDelegate.swift
//  29th-Assignment-Youtube
//
//  Created by 김수연 on 2021/12/12.
//

import Foundation
import UIKit

protocol VideoCellDelegate {
    func videoCellDidTapped(image: UIImage, title: String, description: String)
}
