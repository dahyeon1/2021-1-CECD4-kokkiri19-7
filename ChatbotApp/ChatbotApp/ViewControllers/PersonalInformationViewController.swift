//
//  PersonalInformationViewController.swift
//  ChatbotApp
//
//  Created by Yeon on 2021/06/01.
//

import UIKit
import KakaoSDKUser

final class PersonalInformationViewController: UIViewController {
    static let identifier = "PersonalInformationViewController"
    //MARK:- properties for settingView
    @IBOutlet weak var settingScrollView: UIScrollView!
    @IBOutlet weak var settingBarButton: UIBarButtonItem!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var sexSegmentControl: UISegmentedControl!
    @IBOutlet weak var ageDatePicker: UIDatePicker!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var provinceTextField: UITextField!
    @IBOutlet weak var errorMessageTextLabel: UILabel!
    @IBOutlet weak var doneButton: UIButton!
    
    //MARK:-properties for settedView
    @IBOutlet weak var settedScrollView: UIScrollView!
    @IBOutlet weak var settedNicknameLabel: UILabel!
    @IBOutlet weak var settedEmailLabel: UILabel!
    @IBOutlet weak var settedGenderLabel: UILabel!
    @IBOutlet weak var settedBirthdayLabel: UILabel!
    @IBOutlet weak var settedLocationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNotification()
    }
    
    private func moveToLoginViewController() {
        guard let loginViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: LoginViewController.identifier) as? LoginViewController else {
            return
        }
        
        loginViewController.modalPresentationStyle = .fullScreen
        self.present(loginViewController, animated: true, completion: nil)
    }
    
    //MARK:- UserSettingView
    private func configureUserSettingView() {
        //MARK:-TODO Fix server
        // 사용자가 수정 버튼 누른 경우 or 사용자가 맨 처음에 사용하는 경우
        // 서버로부터 사용자 데이터 받아와서 이를 표시해주기
        DispatchQueue.main.async {
            self.nicknameLabel.text = User.shared.nickname
            self.emailLabel.text = User.shared.email
            
            if let sex = User.shared.gender {
                switch sex {
                case .male:
                    self.sexSegmentControl.selectedSegmentIndex = 0
                case .female:
                    self.sexSegmentControl.selectedSegmentIndex = 1
                }
            }
            
            if let birthday = User.shared.birthday {
                self.ageDatePicker.setDate(birthday, animated: true)
            }
            
            if let city = User.shared.city {
                self.cityTextField.text = city
            }
            
            if let province = User.shared.province {
                self.provinceTextField.text = province
            }
        }
    }
    
    private func getKakaoUserInformation() {
        //MARK:-TODO
        // 만약 서버에서 데이터가 없는 경우에는 여기서 사용자 정보를 가져옴과 동시에
        // UserSettingView를 보여주자
        UserApi.shared.me { [weak self] (user, error) in
            if let error = error {
                print(error)
            }
            let nickname = user?.kakaoAccount?.profile?.nickname
            let email = user?.kakaoAccount?.email
            
            User.shared.nickname = nickname
            User.shared.email = email
            
            self?.configureUserSettingView()
        }
    }
    
    //MARK:- Notification
    private func registerNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(didReceiveLoginSuccess), name: NSNotification.Name.LoginSuccess, object: nil)
    }
    
    @objc private func didReceiveLoginSuccess(_ sender: Notification) {
        //MARK:TODO
        // 서버로부터 어떠한 응답이 왔는지에 따라서 어떤 화면 보여줄지 분기처리
        getKakaoUserInformation()
    }
}

extension Notification.Name {
    static let LoginSuccess = Notification.Name("LoginSuccess")
}
