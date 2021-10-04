//
//  ResultViewController.swift
//  29th-1week-seminar
//
//  Created by 김수연 on 2021/10/02.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet var dataLabel: UILabel!
    
    // 메세지가 넘어올수도, 안넘어올수도 있음
    var message: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setMessageInLabel()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func setMessageInLabel(){
        if let msg = message {
            dataLabel.text = msg
            dataLabel.sizeToFit()
        }
    }

    @IBAction func touchUpToGoBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
