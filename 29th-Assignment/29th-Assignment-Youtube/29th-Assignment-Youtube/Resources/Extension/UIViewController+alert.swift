//
//  UIViewController+alert.swift
//  29th-Assignment-Youtube
//
//  Created by 김수연 on 2021/11/09.
//

import Foundation
import UIKit

// 📌 PR : 현규슨배의 익스텐션 사용법 쇽샥... 근데 어떻게 나눠야 할지 몰라서 두개를 만들었습니다..
extension UIViewController {
    // Networking Alert
    func successAlert(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default) { (action) in
            guard let welcomeVC = self.storyboard?.instantiateViewController(withIdentifier: "WelcomeVC") as? WelcomeVC else {return}
        
            welcomeVC.modalPresentationStyle = .fullScreen
            self.present(welcomeVC, animated: true, completion: nil)
        }
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    func failAlert(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default)
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
