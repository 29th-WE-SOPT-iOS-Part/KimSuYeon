


### 📌 1주차 과제 리드미
<br/>

- [X] UI 구성하기    
- [X] 화면전환하기    
- [X] 기능구현하기   
- [X] 도전과제 1   
- [X] 도전과제 2 
<br/>  

![Simulator Screen Recording - iPhone 13 - 2021-10-08 at 13 37 26](https://user-images.githubusercontent.com/81313960/136499805-965e0a1c-1f46-40df-8100-d1cdbd8b2def.gif)   


구현.. 화면 .. ( 엉망진창 ui는 다음주 오토레이아웃 배우면서 수정해보겠씁니다 화이팅 ! ) 


<br/>

#### 🦋 화면전환하기
- 로그인, 회원가입 화면 -> 환영합니다 화면 : 모달 방식으로 구현 ( present )


```swift
@IBAction func nextButton(_ sender: Any) {
        guard let welcomeVC = self.storyboard?.instantiateViewController(withIdentifier:
        "WelcomeViewController") as? WelcomeViewController else {return}
        
        welcomeVC.userName = nameTextField.text
        welcomeVC.modalPresentationStyle = .fullScreen
        self.present(welcomeVC, animated: true, completion: nil)
        
    }
```    
<br/>

- 로그인 화면의 계정만들기 버튼 -> 회원가입 화면 : 네비게이션 방식으로 구현 ( push )


```swift
@IBAction func nextButton(_ sender: UIButton) {
        guard let welcomeVC = self.storyboard?.instantiateViewController(withIdentifier: 
        "WelcomeViewController") as? WelcomeViewController else {return}
        
        welcomeVC.userName = nameTextField.text
        welcomeVC.modalPresentationStyle = .fullScreen
        self.present(welcomeVC, animated: true, completion: nil)
    }
```
<br/>



#### 🦋 기능구현하기
- 로그인, 회원가입 화면에서 전달받은 userName 프로퍼티를 환영합니다 화면에 환영메시지와 함께 띄워주기 
- 문자열 보간법을 사용하여 환영메세지 표시 


```swift 
    var userName: String?
    
    // MARK: Life Cycle
    
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
 ```
 
<br/>


#### 🚀 도전과제 2 

- 회원가입 화면에서 비밀번호 표시를 누를 경우 비밀번호가 표시되도록 구현하기

```swift
@IBAction func showPasswordButton(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected {
            passwordTextField.isSecureTextEntry = false
            showPasswordButton.setImage(UIImage(systemName: "checkmark.square" ), for: .selected)
        } else {
            passwordTextField.isSecureTextEntry = true
            showPasswordButton.setImage(UIImage(systemName: "square"), for: .normal)
        }
    }
```
1. 비밀번호 표시 버튼을 누를 경우 암호화(?)된 부분이 해제(false)되고, 버튼 이미지를 기본 내장 아이콘인 `checkmark.squre` 로 변경
2. 선택된 상태에서 다시 누를 경우 원래 상태로 돌아오도록 구현 
3. 새로 알게된 부분 : 기본 내장 아이콘 사용시 `systemName:` 옵션을 사용 ! 


<br/>

#### 🌱 금잔디파 - 도전과제 1 수정 

- OB분들의 코드리뷰를 적극 반영하여 수정한 사항입니다 ( 멋있고 든든한 오비분덜..🍎 )     
- 다음주 코드리뷰에 반영 : 코딩컨벤션 읽어보고 참고해서 코드짜기 

<br/>
   
👑 금잔디 F4 이정현규 선배의 코드리뷰 : **도전과제1** 에서 텍스트 필드가 값이 있는지 없는지 확인하는 부분 

1. `nameTextField.hasText` : 텍스트를 가졌다면 true 값을 가지는 프로퍼티
2. `nameTextField.text!.isEmpty` : String 이 Character 를 가지지 않았다면 true 값을 가지는 프로퍼티입니다. 즉, 비었다면 true! 



```swift
@objc func textFieldDidEndEditing(_ textField: UITextField) {
        if nameTextField.hasText && emailTextField.hasText && passwordTextField.hasText {
            nextButton.isEnabled = true
        } else {
            nextButton.isEnabled = false
        }
    }
```
- 전부 텍스트 값이 있을 때 버튼을 활성화시키도록 `hasText` 사용해서 다시 수정해봤습니다 ! 


