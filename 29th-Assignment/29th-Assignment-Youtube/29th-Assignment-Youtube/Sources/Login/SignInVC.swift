//
//  ViewController.swift
//  29th-Assignment-Youtube
//
//  Created by 김수연 on 2021/10/06.
//

import UIKit

class SignInVC: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var nextButton: UIButton!
    
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
    
    @IBAction func createAccountButtonDidTap(_ sender: UIButton) {
        guard let signUpVC = self.storyboard?.instantiateViewController(withIdentifier: "SignUpVC") else {return}
        
        self.navigationController?.pushViewController(signUpVC, animated: true)
    }
    
    @IBAction func nextButtonDidTap(_ sender: UIButton) {
        requestLogin()
    }
}

// MARK: - Extensions

extension SignInVC: UITextFieldDelegate {
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

extension SignInVC {
    // 📌 PR : 이부분 이렇게 하눈게 맞눈곤지,,,
    func requestLogin(){
        UserSignInService.shared.login(email: emailTextField.text ?? "" , password: passwordTextField.text ?? "") { reponseData in
            switch reponseData {
            case .success(let loginResponse):
                guard let response = loginResponse as? LoginResponseData else { return }
                if response.data != nil {
                    UserDefaults.standard.set(self.nameTextField.text, forKey: UserDefaults.Keys.loginUserName)
                    self.makeAlert(title: "로그인", message: response.message, okAction: { _ in
                        guard let welcomeVC = self.storyboard?.instantiateViewController(withIdentifier: "WelcomeVC") as? WelcomeVC else {return}
                        
                        welcomeVC.modalPresentationStyle = .fullScreen
                        self.present(welcomeVC, animated: true, completion: nil)
                    })
                }
            case .requestErr(let loginResponse):
                guard let response = loginResponse as? LoginResponseData else { return }
                print("requestERR \(response.message)")
                self.makeAlert(title: "로그인", message: response.message, okAction: { _ in
                    self.setTextFieldEmpty()
                })
            case .pathErr(let msg):
                print("pathErr")
                guard let response = msg as? LoginResponseData else { return }
                self.makeAlert(title: "로그인", message: response.message, okAction: { _ in
                    self.setTextFieldEmpty()
                })
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }
    }
}
