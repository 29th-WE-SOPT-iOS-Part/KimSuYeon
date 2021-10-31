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
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var videoTableView: UITableView!
    
    var videoList: [VideoData] = []
    var channelList: [ChannelData] = []
    var categoryList = [String]()
    
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
        
        categoryList.append(contentsOf: [
            "전체", "오늘", "이어서 시청하기", "시청하지 않음", "실시간", "게시물"
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
        
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        
        let categoryXib = UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil)
        categoryCollectionView.register(categoryXib, forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
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
    // sizeForItemAt
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == categoryCollectionView {
            return CGSize(width: categoryList[indexPath.item].size(withAttributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14)]).width + 20, height: 32)
            
        } else {
            return CGSize(width: 72, height: 104)
        }
    }
    
    // insetForSectionAt
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == categoryCollectionView {
            return UIEdgeInsets.init(top: 0, left: 13, bottom: 0, right: 13)
        } else {
            return UIEdgeInsets.zero
        }
    }
    
    // minLineSpacing
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 0
        
    }
    
    // minInteritemSpacing
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == categoryCollectionView {
            return 9
        } else {
            return 0
        }
    }
}

extension HomeVC: UICollectionViewDataSource{
    // numberOfItemsInSection
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == categoryCollectionView{
            return categoryList.count
        } else {
            return channelList.count
        }
    }
    
    // cellForItemAt
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == categoryCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as? CategoryCollectionViewCell else {return UICollectionViewCell()}
            
            cell.setCategoryData(category: categoryList[indexPath.row])
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChannelCollectionViewCell.identifier, for: indexPath) as? ChannelCollectionViewCell else {return UICollectionViewCell()}
            
            cell.setData(channelData: channelList[indexPath.row])
            return cell
        }
    }
}

extension HomeVC: UICollectionViewDelegate{
    
}
