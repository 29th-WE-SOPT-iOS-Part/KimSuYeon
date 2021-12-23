//
//  UIViewController + Extension.swift
//  29th-Assignment-Youtube
//
//  Created by 김수연 on 2021/11/05.
//

import UIKit

extension UIViewController: CustomViewDelegate {
    func touchUpToGoLogin() {
        guard let naviVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NavigationController") as? UINavigationController else { return }
        
        naviVC.modalPresentationStyle = .fullScreen
        naviVC.modalTransitionStyle = .crossDissolve
        
        present(naviVC, animated: true, completion: nil)
    }
}

extension UIViewController {
    func hideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer (target: self,
                                                                  action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

