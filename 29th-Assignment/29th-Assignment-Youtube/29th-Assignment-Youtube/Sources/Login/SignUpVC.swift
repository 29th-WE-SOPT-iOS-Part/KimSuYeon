//
//  SignUpViewController.swift
//  29th-Assignment-Youtube
//
//  Created by 김수연 on 2021/10/06.
//

import UIKit

class SignUpVC: UIViewController {
    

    // MARK: - IBOutlets
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var showPasswordButton: UIButton!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNextButton()
        setTextField()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setTextFieldEmpty()
    }
    
    // MARK: - Methods
    // MARK: Custom Method
    
    func setNextButton() {
        nextButton.isEnabled = false
    }
    
    func setTextField() {
        [nameTextField, emailTextField, passwordTextField].forEach {
            $0?.delegate = self
        }
    }
    
    func setTextFieldEmpty() {
        [nameTextField, emailTextField, passwordTextField].forEach {
            $0?.text = ""
        }
    }
    
    // MARK: - IBActions
    
    @IBAction func showPasswordButtonDidTap(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected {
            passwordTextField.isSecureTextEntry = false
            showPasswordButton.setImage(UIImage(systemName: "checkmark.square" ), for: .selected)
        } else {
            passwordTextField.isSecureTextEntry = true
            showPasswordButton.setImage(UIImage(systemName: "square"), for: .normal)
        }
    }
    
    @IBAction func nextButtonDidTap(_ sender: Any) {
        requestSignUp()
    }
}

// MARK: - Extensions

extension SignUpVC: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if nameTextField.hasText && emailTextField.hasText && passwordTextField.hasText {
            nextButton.isEnabled = true
        } else {
            nextButton.isEnabled = false
        }
    }
    
    func textFieldShouldReturn (_ textField: UITextField) -> Bool {
        switch textField {
        case nameTextField: emailTextField.becomeFirstResponder()
        case emailTextField: passwordTextField.becomeFirstResponder()
        case passwordTextField: passwordTextField.resignFirstResponder()
        default: break
        }
        return true
    }
}

extension SignUpVC {
    // Networking Alert
    func successAlert(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default) { (action) in
            guard let welcomeVC = self.storyboard?.instantiateViewController(withIdentifier: "WelcomeVC") as? WelcomeVC else {return}
            
            welcomeVC.userName = self.nameTextField.text
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
    
    func requestSignUp(){
        UserSignService.shared.signUp(email: emailTextField.text ?? "", name: nameTextField.text ?? "" , password: passwordTextField.text ?? "") { reponseData in
            switch reponseData {
            case .success(let signUpResponse):
                guard let response = signUpResponse as? SignUpResponseData else { return }
                if response.data != nil {
                    self.successAlert(title: "회원가입", message: response.message)
                }
            case .requestErr(let msg):
                print("requestERR \(msg)")
                guard let response = msg as? LoginResponseData else { return }
                self.failAlert(title: "회원가입", message: response.message)
            case .pathErr(let msg):
                print("pathErr")
                guard let response = msg as? LoginResponseData else { return }
                self.failAlert(title: "회원가입", message: response.message)
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }
    }
}
