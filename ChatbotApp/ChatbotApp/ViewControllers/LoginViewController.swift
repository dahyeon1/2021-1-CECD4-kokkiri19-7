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
                self?.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    @IBAction private func loginWithNaver(_ sender: UIButton) {
        // TODO
    }
}
