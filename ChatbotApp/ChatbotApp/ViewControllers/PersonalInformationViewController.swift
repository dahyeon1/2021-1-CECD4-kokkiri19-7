//
//  PersonalInformationViewController.swift
//  ChatbotApp
//
//  Created by Yeon on 2021/06/01.
//

import UIKit

final class PersonalInformationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupPersonalInformationViewControllerBackground()
    }
    
    private func setupPersonalInformationViewControllerBackground() {
        self.view.backgroundColor = UIColor.chatBackgroundEnd
    }
}
