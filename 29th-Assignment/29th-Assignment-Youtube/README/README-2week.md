### 📌 2주차 과제 리드미
<br/>

- [x] 로그인 화면 AutoLayout 적용하기
- [x] 회원가입 화면 AutoLayout 적용하기
- [x] 확인 화면 AutoLayout 적용하기
- [x] 확인 화면에 "다른 계정으로 로그인하기" 버튼 추가하기
- [x] 확인 화면에 "다른 계정으로 로그인하기 버튼 추가" 누르면 처음 로그인 화면으로 돌아가기
- [x] 확인 화면에서 확인 화면 누르면 Tabbar로 연결된 화면 Present 하기
- [x] Tabbar에 5개의 view controller 연결하기
- [x] tabbar title, image, selected image 바꾸기

---
#### ✨ AutoLayout 적용하기 & 다른 계정으로 로그인 하기 버튼 추가 

![image](https://user-images.githubusercontent.com/81313960/137844974-c74d556e-9dd3-4e8b-8612-ee8fe5c8234e.png)

#### 🔮 TabbarController 

1. Tabbar 화면 구성하기 

![Simulator Screen Recording - iPhone 13 - 2021-10-19 at 13 51 54](https://user-images.githubusercontent.com/81313960/137846074-c6d69f15-9ce3-4ba7-8f51-e8cf77f34821.gif)

2. 확인 버튼 누를 시, 탭바 화면으로 이동
```swift
@IBAction func confirmButton(_ sender: Any) {
        let tabBarStoryboard = UIStoryboard.init(name: "TabBar", bundle: nil)
        
        guard let tabbar = tabBarStoryboard.instantiateViewController(withIdentifier: "TabBarController") as? TabBarController else {return}
        
        tabbar.modalPresentationStyle = .fullScreen
        tabbar.modalTransitionStyle = .crossDissolve
        present(tabbar, animated: true, completion: nil)
    }
```

#### ✅ 다른 계정으로 로그인하는 기능 구현하기 !

#### 1️⃣ 처음에 내가 짠 코드

```swift
@IBAction func otherLoginButtonDidTap(_ sender: Any) {
        guard let naviVC = self.storyboard?.instantiateViewController(withIdentifier: "NavigationController")
                as? NavigationController else {return}

          naviVC.modalPresentationStyle = .fullScreen
          naviVC.modalTransitionStyle = .crossDissolve
          self.present(naviVC, animated: true, completion: nil)
    }
```

→ 다른 계정으로 로그인 하기 버튼을 누를 경우, navigation controller를 가져와 naviVC에 저장한뒤, 모달로 다시 띄워주는 방식 ! ( fullscreen으로 , 효과는 crossdissolve )

→ 단순히 로그인 화면 으로 돌아가면 다음 화면인 회원가입 창이 켜지지 않음 ! 스택이 쌓이지 않음 ..!! 

→ 네비게이션 컨트롤러로 돌아가야 로그인 창부터 회원가입 창 까지 스택이 쌓임 !! 

---

#### 2️⃣ 다른 방법으로 시도 !

더 찾아보니 UINavigationController 클래스의 메서드 중에 popToRootViewController를 통해 루트 뷰 컨트롤러까지 pop할 수 있었음 ! 하지만, 문제는 present로 띄운 모달창을 없애야 pop이 정상적으로 작동 된다는 것! 

- 첫 번째 시도
    
    `self.navigationController?.popToRootViewController(animated: false)`
    
    이렇게만 해주면 작동이 안됨.. 
    
- 두 번째 시도
    
    ```swift
    self.dismiss(animated: true) {
    	self.navigationController?.popToRootViewController(animated: true)
    }
    ```
    
    두 번째로 시도한건 dissmiss 해주면서 루트 뷰 컨트롤러로 바로 돌아가게 해주는 것 ! 
    
    근데 이것도 제대로 작동을 하지 않았음 ! 그래서 코드리뷰하면서 오비 선배림들한테 여쭤봄 .! 
    

 애플 공식 문서 참고 ! 

[Apple Developer Documentation](https://developer.apple.com/documentation/uikit/uinavigationcontroller)

---

#### 3️⃣ 현규선배님의 코드리뷰 ^^ 무한한 감사를...

📌 루트뷰로 돌아가기 위해서 `popToRootViewController(animated:)` 메서드를 시도했을거라고 생각해요!dismiss 하게되면 현재 뷰가 메모리 상에서 사라집니다. 그래서 아래의 코드를 사용하면 이미 사라진 현재뷰의 navigationController 를 참조하게 되는 꼴이되죠! 아마 여기를 놓쳤을 것 같아요

```swift
self.dismiss(animated: true) {
               self.navigationController?.popViewController(animated: true)
            }
```

그래서 `guard let presentingVC = self.presentingViewController else { return }` 이렇게 현재 뷰컨트롤러를 제공한 뷰컨트롤러 객체를 가져와서 presentingVC 를 대상으로 pop 시켜줘야 한답니다!

```swift
        guard let presentingVC = self.presentingViewController as? UINavigationController else { return }
        dismiss(animated: true) {
                presentingVC.popToRootViewController(animated: true)
            }
```

---

#### 🔮 코드리뷰 반영하기 !

결론 ? ~~dissmiss 하는 순간 현재 뷰가 메모리에서 사라지기 때문에 ! 현재 뷰를 다시 가져와서 그 뷰에서 루트 뷰 컨트롤러로 pop해줘야된다~~

-> 수정 : 현재 뷰가 메모리에서 사라지기 때문에 `self.navigationController?` 가 비어있어요. 그리고 애초에 present 로 뷰가 화면전환되었기 때문에 viewDidLoad() 에서 출력해보셔도 비어있습니다! push 로 화면전환을 한 것이 아니기 때문이죠! 그래서 이 부분은 dismiss 하면 메모리에서 뷰가 해제되는데 `self.` 로 접근할 수 있는 것이 없다! 라고 생각하시면 될거같아요👍

```swift
@IBAction func otherLoginButtonDidTap(_ sender: Any) {
        guard let presentingVC = self.presentingViewController as? UINavigationController else { return }
            self.dismiss(animated: true) {
                presentingVC.popToRootViewController(animated: true)
            }
    }
```
