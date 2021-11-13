//
//  WelcomeUserViewController.swift
//  29th-Assignment-Youtube
//
//  Created by 김수연 on 2021/10/06.
//

import UIKit

class WelcomeVC: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet var welcomeLabel: UILabel!
    @IBOutlet var otherLoginButton: UIButton!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUserNameInLabel()
    }
    
    // MARK: - Methods
    // MARK: Custom Method
    
    func setUserNameInLabel() {
        if let user = UserDefaults.standard.string(forKey: "userName") {
            welcomeLabel.text = "\(user)님 환영합니다!"
            welcomeLabel.sizeToFit()
        }
    }
    
    // MARK: - IBActions
    
    @IBAction func confirmButton(_ sender: Any) {
        let tabBarStoryboard = UIStoryboard.init(name: "TabBar", bundle: nil)
        
        guard let tabbar = tabBarStoryboard.instantiateViewController(withIdentifier: "TabBarController") as? TabBarController else {return}
        
        tabbar.modalPresentationStyle = .fullScreen
        tabbar.modalTransitionStyle = .crossDissolve
        present(tabbar, animated: true, completion: nil)
    }
    
    @IBAction func otherLoginButtonDidTap(_ sender: Any) {
        guard let presentingVC = self.presentingViewController as? UINavigationController else { return }
            self.dismiss(animated: true) {
                presentingVC.popToRootViewController(animated: true)
            }
    }
}
