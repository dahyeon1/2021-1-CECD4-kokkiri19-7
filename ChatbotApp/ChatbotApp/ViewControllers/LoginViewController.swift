//
//  LoginViewController.swift
//  ChatbotApp
//
//  Created by Yeon on 2021/09/15.
//

import UIKit
import KakaoSDKAuth
import KakaoSDKUser

final class LoginViewController: UIViewController {
    static let identifier = "LoginViewController"
    @IBOutlet weak var kakaoLoginButton: UIButton!
    @IBOutlet weak var naverLoginButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction private func loginWithKakao(_ sender: UIButton) {
        if UserApi.isKakaoTalkLoginAvailable() {
            UserApi.shared.loginWithKakaoTalk { [weak self] token, error in
                if let error = error {
                    print(error)
                }
                
                NotificationCenter.default.post(name: NSNotification.Name.LoginSuccess, object: nil)
                //MARK:-TODO 서버에 데이터 있는지 없는지 확인하기..? 이후 있으면 notification에 담아서 보내자
                self?.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    @IBAction private func loginWithNaver(_ sender: UIButton) {
        // TODO
    }
    
    @IBAction private func didCancelButtonTouchedUp(_ sender: UIButton) {
        NotificationCenter.default.post(name: NSNotification.Name.CancelButtonTouchedUp, object: nil)
        self.dismiss(animated: true, completion: nil)
    }
}
