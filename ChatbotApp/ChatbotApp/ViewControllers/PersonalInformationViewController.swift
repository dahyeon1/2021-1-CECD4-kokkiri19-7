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
    
    private func setupChatbotNavigationBar() {
        let kmNavigationBarProxy = UINavigationBar.appearance(whenContainedInInstancesOf: [KMBaseNavigationViewController.self])
        kmNavigationBarProxy.isTranslucent = false
        // Navigation Bar's Background Color
        kmNavigationBarProxy.barTintColor = UIColor.chatBackgroundStart
        // Navigation Bar's Tint color
        kmNavigationBarProxy.tintColor = UIColor.white
        // Navigation Bar's Title color
        kmNavigationBarProxy.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        Kommunicate.defaultConfiguration.hideFaqButtonInConversationList = true // Hide from Conversation List screen
        Kommunicate.defaultConfiguration.hideFaqButtonInConversationView = true // Hide from Conversation screen
    }
}
