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
    
    var videoList: [VideoData] = []
    var channelList: [ChannelData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initDataList()
        
        setTableView()
        setCollectionView()
    }
    
    func initDataList(){
        videoList.append(contentsOf: [
            VideoData(thumbnailImageName: "wesoptiOSPart", videoTitle: "1차 세미나 : iOS 컴포넌트 이해, Xcode 기본 사용법, View 화면전환", channelImageName: "wesoptProfile", channelName: "WE SOPT", views: 100, uploadDate: "3주"),
            VideoData(thumbnailImageName: "wesoptiOSPart", videoTitle: "2차 iOS 세미나 : AutoLayout, StackView, TabBarController", channelImageName: "wesoptProfile", channelName: "WE SOPT", views: 100, uploadDate: "3주"),
            VideoData(thumbnailImageName: "wesoptiOSPart", videoTitle: "3차 iOS 세미나 : ScrollView, Delegate Pattern, TableView, CollectionView", channelImageName: "wesoptProfile", channelName: "WE SOPT", views: 100, uploadDate: "3주"),
            VideoData(thumbnailImageName: "wesoptiOSPart", videoTitle: "4차 iOS 세미나 : Cocoapods & Networking, REST API", channelImageName: "wesoptProfile", channelName: "WE SOPT", views: 100, uploadDate: "3주"),
            VideoData(thumbnailImageName: "wesoptiOSPart", videoTitle: "7차 iOS 세미나 : Animation과 제스쳐, 데이터 전달 심화 ", channelImageName: "wesoptProfile", channelName: "WE SOPT", views: 100, uploadDate: "3주"),
            VideoData(thumbnailImageName: "wesoptiOSPart", videoTitle: "AppJam", channelImageName: "wesoptProfile", channelName: "WE SOPT", views: 100, uploadDate: "3주")
        ])
        
        channelList.append(contentsOf: [
            ChannelData(channelImageName: "ggamju1", channelName: "구독리스트"),
            ChannelData(channelImageName: "ggamju2", channelName: "공개합니다"),
            ChannelData(channelImageName: "ggamju3", channelName: "자취남"),
            ChannelData(channelImageName: "ggamju4", channelName: "인보라"),
            ChannelData(channelImageName: "ggamju5", channelName: "티빙"),
            ChannelData(channelImageName: "ggamju6", channelName: "비타민신지니"),
            ChannelData(channelImageName: "ggamju7", channelName: "짧은대본")
        ])
    }
    
    func setTableView(){
        videoTableView.dataSource = self
        videoTableView.delegate = self
        
        let videoXib = UINib(nibName: VideoTableViewCell.identifier, bundle: nil)
        videoTableView.register(videoXib, forCellReuseIdentifier: VideoTableViewCell.identifier)
    }
    
    func setCollectionView(){
        channelCollectionView.delegate = self
        channelCollectionView.dataSource = self
        
        let channelXib = UINib(nibName: ChannelCollectionViewCell.identifier, bundle: nil)
        channelCollectionView.register(channelXib, forCellWithReuseIdentifier: ChannelCollectionViewCell.identifier)
    }
    
}

extension HomeVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: VideoTableViewCell.identifier) as? VideoTableViewCell else {return UITableViewCell()}
        
        cell.setData(videoData: videoList[indexPath.row])
        return cell
    }
}

extension HomeVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 306
    }
}

extension HomeVC: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 72, height: 104)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension HomeVC: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return channelList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChannelCollectionViewCell.identifier, for: indexPath) as? ChannelCollectionViewCell else {return UICollectionViewCell()}
        
        cell.setData(channelData: channelList[indexPath.row])
        return cell
    }
}

extension HomeVC: UICollectionViewDelegate{
    
}
