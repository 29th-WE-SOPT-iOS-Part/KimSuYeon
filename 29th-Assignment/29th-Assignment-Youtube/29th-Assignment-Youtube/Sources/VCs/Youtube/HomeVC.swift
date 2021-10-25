//
//  HomeVC.swift
//  29th-Assignment-Youtube
//
//  Created by 김수연 on 2021/10/17.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var windowSharingButton: UIButton!
    @IBOutlet weak var notificationButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var channelCollectionView: UICollectionView!
    @IBOutlet weak var videoTableView: UITableView!
    
    var videoDataList: [VideoData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initVideoDataList()
        registerXib()
        videoTableView.dataSource = self
        videoTableView.delegate = self
    }
    
    func registerXib(){
        let xibNAME = UINib(nibName: VideoTableViewCell.identifier, bundle: nil)
        videoTableView.register(xibNAME, forCellReuseIdentifier: VideoTableViewCell.identifier)
    }
    
    func initVideoDataList(){
        videoDataList.append(contentsOf: [
            VideoData(thumbnailImageName: "wesoptiOSPart", videoTitle: "1차 세미나 : iOS 컴포넌트 이해, Xcode 기본 사용법, View 화면전환", channelImageName: "wesoptProfile", channelName: "WE SOPT", views: 100, uploadDate: "3주"),
            VideoData(thumbnailImageName: "wesoptiOSPart", videoTitle: "2차 iOS 세미나 : AutoLayout, StackView, TabBarController", channelImageName: "wesoptProfile", channelName: "WE SOPT", views: 100, uploadDate: "3주"),
            VideoData(thumbnailImageName: "wesoptiOSPart", videoTitle: "3차 iOS 세미나 : ScrollView, Delegate Pattern, TableView, CollectionView", channelImageName: "wesoptProfile", channelName: "WE SOPT", views: 100, uploadDate: "3주"),
            VideoData(thumbnailImageName: "wesoptiOSPart", videoTitle: "4차 iOS 세미나 : Cocoapods & Networking, REST API", channelImageName: "wesoptProfile", channelName: "WE SOPT", views: 100, uploadDate: "3주"),
            VideoData(thumbnailImageName: "wesoptiOSPart", videoTitle: "7차 iOS 세미나 : Animation과 제스쳐, 데이터 전달 심화 ", channelImageName: "wesoptProfile", channelName: "WE SOPT", views: 100, uploadDate: "3주"),
            VideoData(thumbnailImageName: "wesoptiOSPart", videoTitle: "AppJam", channelImageName: "wesoptProfile", channelName: "WE SOPT", views: 100, uploadDate: "3주")
            
        ])
    }
}

extension HomeVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videoDataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: VideoTableViewCell.identifier) as? VideoTableViewCell else {return UITableViewCell()}
        
        cell.setData(videoData: videoDataList[indexPath.row])
        return cell
    }
}

extension HomeVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 306
    }
}
