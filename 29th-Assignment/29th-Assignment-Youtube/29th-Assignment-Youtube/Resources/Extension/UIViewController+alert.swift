//
//  UIViewController+alert.swift
//  29th-Assignment-Youtube
//
//  Created by 김수연 on 2021/11/09.
//

import Foundation
import UIKit

extension UIViewController {
    // Networking Alert
    func makeAlert(title: String,
                   message: String,
                   okAction : ((UIAlertAction) -> Void)? = nil,
                   completion : (() -> ())? = nil)
    {
        let alertViewController = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: okAction)
        alertViewController.addAction(okAction)
//            guard let welcomeVC = self.storyboard?.instantiateViewController(withIdentifier: "WelcomeVC") as? WelcomeVC else {return}
//
//            welcomeVC.modalPresentationStyle = .fullScreen
//            self.present(welcomeVC, animated: true, completion: nil)
        
        self.present(alertViewController, animated: true, completion: completion)
    }
}
