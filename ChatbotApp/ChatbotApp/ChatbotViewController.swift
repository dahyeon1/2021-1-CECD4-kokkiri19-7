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

class ChatbotViewController: UIViewController {
    
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
        addToolBar()
        addChatbotTableView()
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
    
    private func addToolBar() {
        containerView.addSubview(toolbar)
        self.toolbarBottomConstraint = self.toolbar.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0)
        self.toolbarBottomConstraint?.isActive = true
        let bottomView = UIView()
        bottomView.backgroundColor = .chatBackgroundEnd
        containerView.addSubview(bottomView)
        bottomView.snp.makeConstraints { (make) -> Void in
            make.right.equalTo(containerView)
            make.left.equalTo(containerView)
            make.top.equalTo(toolbar.snp.bottom)
            make.height.equalTo(100)
        }
    }
    
    private func addChatbotTableView() {
        containerView.addSubview(chatbotTableView)
        chatbotTableView.snp.makeConstraints { (make) -> Void in
            make.bottom.equalTo(toolbar.snp.top)
            make.right.equalTo(containerView)
            make.left.equalTo(containerView)
            make.top.equalTo(containerView)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureToolbar()
    }
    
    //MARK: Toolbar
    private func configureToolbar() {
        setupToolbar()
        setupToolbarWrapperView()
        addTapGesture()
    }
    
    private func setupToolbar() {
        let textView: UITextView = UITextView(frame: .zero)
        textView.delegate = self
        textView.font = UIFont.systemFont(ofSize: 14)
        textView.backgroundColor = UIColor.black.withAlphaComponent(0.30)
        textView.textColor = .white
        self.textView = textView
        textView.layer.cornerRadius = 10
        
        toolbarTextView = ToolbarItem(customView: textView)
        toolbarSendButton = ToolbarItem(title: "SEND", target: self, action: #selector(send))
        toolbarSendButton!.tintColor = .mainGreen
        toolbarSendButton!.setEnabled(true, animated: false)
        toolbar.setItems([toolbarTextView!, toolbarSendButton!], animated: false)
        toolbar.backgroundColor = .black
    }
    
    private func setupToolbarWrapperView() {
        let toolbarWrapperView = UIView()
        toolbarWrapperView.backgroundColor = .grayBlue
        toolbar.insertSubview(toolbarWrapperView, at: 1)
        toolbarWrapperView.snp.makeConstraints { (make) -> Void in
            make.bottom.equalTo(toolbar)
            make.right.equalTo(toolbar)
            make.left.equalTo(toolbar)
            make.top.equalTo(toolbar)
        }
    }
    
    private func addTapGesture() {
        let gestureRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hide))
        self.view.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func send() {
        if self.textView!.text != "" {
            let message = Message(text: self.textView!.text!, date: Date(), type: .user)
            self.sendMessage(message)
            
            self.textView?.text = nil
            if let constraint: NSLayoutConstraint = self.constraint {
                self.textView?.removeConstraint(constraint)
            }
            self.toolbar.setNeedsLayout()
        }
    }
    
    @objc func hide() {
        self.textView?.resignFirstResponder()
    }
    
    @objc final func keyboardWillShow(notification: Notification) {
        moveToolbar(up: true, notification: notification)
    }
    
    @objc final func keyboardWillHide(notification: Notification) {
        moveToolbar(up: false, notification: notification)
    }
    
    final func moveToolbar(up: Bool, notification: Notification) {
        guard let userInfo = notification.userInfo else {
            return
        }
        let animationDuration: TimeInterval = (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
        let keyboardHeight = up ? -(userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue.height : 0
        
        // Animation
        self.toolbarBottomConstraint?.constant = keyboardHeight
        UIView.animate(withDuration: animationDuration, animations: {
            self.toolbar.layoutIfNeeded()
        }, completion: nil)
        self.isMenuHidden = up
    }
    
    // MARK:- send message
    private func sendMessage(_ message: Message) {
        messages.append(message)
        chatbotTableView.beginUpdates()
        chatbotTableView.re.insertRows(at: [IndexPath(row: messages.count - 1, section: 0)], with: .automatic)
        chatbotTableView.endUpdates()
    }
}

extension ChatbotViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        self.isMenuHidden = true
    }
}
