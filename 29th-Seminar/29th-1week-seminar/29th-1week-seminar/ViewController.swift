//
//  ViewController.swift
//  29th-1week-seminar
//
//  Created by 김수연 on 2021/10/02.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet var testLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func touchUpbtn(_ sender: UIButton) {
        testLabel.text = "We SOPT iOS"
        testLabel.sizeToFit()
    }

    @IBAction func touchUpToGoSecondView(_ sender: UIButton) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController")
            else {return}
        
//        nextVC.modalPresentationStyle = .pageSheet
//        nextVC.modalTransitionStyle = .crossDissolve
//
//        self.present(nextVC, animated: true, completion: nil)
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}
