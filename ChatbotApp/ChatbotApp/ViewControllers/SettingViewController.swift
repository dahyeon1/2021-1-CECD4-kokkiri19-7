//
//  SettingViewController.swift
//  ChatbotApp
//
//  Created by Yeon on 2021/06/01.
//

import UIKit

final class SettingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSettingViewControllerBackground()
    }
    
    private func setupSettingViewControllerBackground() {
        self.view.backgroundColor = UIColor.chatBackgroundEnd
    }
}
