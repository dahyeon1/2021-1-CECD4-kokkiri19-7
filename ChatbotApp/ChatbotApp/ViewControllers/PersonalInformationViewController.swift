//
//  PersonalInformationViewController.swift
//  ChatbotApp
//
//  Created by Yeon on 2021/06/01.
//

import UIKit
import Kommunicate

final class PersonalInformationViewController: UIViewController {
    
    let userID = Kommunicate.randomId()
    let kmUser = KMUser()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupPersonalInformationViewControllerBackground()
    }
    
    private func setupPersonalInformationViewControllerBackground() {
        self.view.backgroundColor = UIColor.chatBackgroundEnd
    }
    
    private func registerUser() {
        kmUser.userId = userID
        kmUser.displayName = "사용자"
        kmUser.applicationId = Configuration.AppID
        
        Kommunicate.registerUser(kmUser) { response, error in
            guard error == nil else {
                return
            }
            print("로그인에 성공하였습니다.")
        }
    }
}
