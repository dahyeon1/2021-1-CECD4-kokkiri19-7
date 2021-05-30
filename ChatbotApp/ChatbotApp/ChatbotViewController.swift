//
//  ChatbotViewController.swift
//  ChatbotApp
//
//  Created by Yeon on 2021/05/28.
//

import UIKit
import ReverseExtension
import Toolbar
import SnapKit

class ChatbotViewController: UIViewController, UITextViewDelegate {

    //MARK: Properties
    // tool bar
    let containerView = UIView()
    let toolbar: Toolbar = Toolbar()
    var textView: UITextView?
    var toolbarTextView: ToolbarItem?
    var toolbarSendButton: ToolbarItem?
    var toolbarBottomConstraint: NSLayoutConstraint?
    var constraint: NSLayoutConstraint?
    
    // message
    var chatbotTableView = UITableView()
    var messages = [Message]()
    
    var isMenuHidden: Bool = false {
        didSet {
            if oldValue == isMenuHidden {
                return
            }
            self.toolbar.layoutIfNeeded()
            UIView.animate(withDuration: 0.3) {
                self.toolbar.layoutIfNeeded()
            }
        }
    }
    
    override func loadView() {
        super.loadView()
        
        configureAutoLayout()
        setupChatbotViewControllerBackground()
    }
    
    private func configureAutoLayout() {
        self.view.addSubview(containerView)
        containerView.snp.makeConstraints { (make) -> Void in
            make.bottom.equalTo(self.view.snp.bottomMargin)
            make.right.equalTo(self.view)
            make.left.equalTo(self.view)
            make.top.equalTo(self.view.snp.topMargin)
        }
    }
    
    private func setupChatbotViewControllerBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.chatBackgroundEnd.cgColor, UIColor.chatBackgroundStart.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
        containerView.layer.addSublayer(gradientLayer)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
