//
//  ViewController.swift
//  29th-Assignment-Youtube
//
//  Created by 김수연 on 2021/10/06.
//

import UIKit

class SignInViewController: UIViewController {
    
    // MARK: IBOutlets
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var nextButton: UIButton!
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextButton.isEnabled = false
        self.nameTextField.addTarget(self, action: #selector(self.checkFilledTextField(_:)), for: .editingChanged)
        self.emailTextField.addTarget(self, action: #selector(self.checkFilledTextField(_:)), for: .editingChanged)
        self.passwordTextField.addTarget(self, action: #selector(self.checkFilledTextField(_:)), for: .editingChanged)
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Methods
    // MARK: Custom Method
    
    @objc func checkFilledTextField(_ sender: Any?) {
        
        if nameTextField.text != "" && emailTextField.text != "" && passwordTextField.text != "" {
            nextButton.isEnabled = true
        } else {
            nextButton.isEnabled = false
        }
    }
    
    // MARK: IBActions
    
    @IBAction func createAccountButton(_ sender: UIButton) {
        guard let signUpVC = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") else {return}
        
        self.navigationController?.pushViewController(signUpVC, animated: true)
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
            
        guard let welcomeVC = self.storyboard?.instantiateViewController(withIdentifier: "WelcomeViewController") as? WelcomeViewController else {return}
        
        welcomeVC.userName = nameTextField.text
        welcomeVC.modalPresentationStyle = .fullScreen
        self.present(welcomeVC, animated: true, completion: nil)
    }
    
}
