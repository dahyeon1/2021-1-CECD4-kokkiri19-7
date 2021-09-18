//
//  TabBarController.swift
//  ChatbotApp
//
//  Created by Yeon on 2021/09/14.
//

import UIKit
import KakaoSDKAuth
import KakaoSDKUser

final class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserApi.shared.unlink { error in
            print(error)
        }
        
        registerNotification()
        
        if AuthApi.hasToken() {
            self.selectedIndex = 0
        }
        else {
            self.selectedIndex = 3
        }
        
    }
    
    //MARK:- Notification
    private func registerNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(didReceiveCancelButtonTouchedUp), name: NSNotification.Name.CancelButtonTouchedUp, object: nil)
    }
    
    @objc private func didReceiveCancelButtonTouchedUp(_ sender: Notification) {
        self.selectedIndex = 0
    }
}

extension Notification.Name {
    static let CancelButtonTouchedUp = Notification.Name("CancelButtonTouchedUp")
}
