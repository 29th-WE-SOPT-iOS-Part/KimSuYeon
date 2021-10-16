//
//  WelcomeUserViewController.swift
//  29th-Assignment-Youtube
//
//  Created by 김수연 on 2021/10/06.
//

import UIKit

class WelcomeViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet var welcomeLabel: UILabel!
    var userName: String?
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUserNameInLabel()
    }
    
    // MARK: - Methods
    // MARK: Custom Method
    
    func setUserNameInLabel() {
        if let user = userName {
            welcomeLabel.text = "\(user)님 환영합니다!"
            welcomeLabel.sizeToFit()
        }
    }
    
    // MARK: - IBActions
    @IBAction func confirmButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
