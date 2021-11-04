//
//  UIViewController + Extension.swift
//  29th-Assignment-Youtube
//
//  Created by 김수연 on 2021/11/05.
//

import UIKit

extension UIViewController: CustomViewDelegate {
    func touchUpToGoLogin() {
        guard let naviVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NavigationController") as? NavigationController else { return }
        
        naviVC.modalPresentationStyle = .fullScreen
        naviVC.modalTransitionStyle = .crossDissolve
        
        present(naviVC, animated: true, completion: nil)
    }
}
