//
//  CustomNavigationBar.swift
//  29th-Assignment-Youtube
//
//  Created by 김수연 on 2021/11/01.
//

import UIKit

class CustomNavigationBar: UIView {
    
    public var parentViewController: UIViewController?
    
    public var delegate: CustomViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        customInit()
    }
    
    func customInit() {
        if let view = Bundle.main.loadNibNamed("CustomNavigationBar", owner: self, options: nil)?.first as? UIView {
            view.frame = self.bounds
            addSubview(view)
        }
    }
//    // profile 버튼을 터치하면 로그인 화면으로 전환 : notification 방법
//    private func presentToLoginViewController() {
//        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "TouchProfileButton"), object: nil)
//    }
    
    @IBAction func profileButtonDidTab(_ sender: Any) {
        self.delegate?.touchUpToGoLogin()
        // presentToLoginViewController()
        
//        guard let naviVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NavigationController") as? NavigationController else { return }
//
//        naviVC.modalPresentationStyle = .fullScreen
//        naviVC.modalTransitionStyle = .crossDissolve
//
//        parentViewController?.present(naviVC, animated: true, completion: nil)
    }
    
}
