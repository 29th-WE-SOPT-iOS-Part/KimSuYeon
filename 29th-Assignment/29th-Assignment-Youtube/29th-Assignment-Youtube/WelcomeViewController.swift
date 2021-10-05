//
//  WelcomeUserViewController.swift
//  29th-Assignment-Youtube
//
//  Created by 김수연 on 2021/10/06.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!
    var userName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUserNameInLabel()
        // Do any additional setup after loading the view.
    }
    
    func setUserNameInLabel() {
        if let user = userName {
            welcomeLabel.text = "\(user)님 환영합니다!"
            welcomeLabel.sizeToFit()
        }
    }
    
    @IBAction func confirmButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
