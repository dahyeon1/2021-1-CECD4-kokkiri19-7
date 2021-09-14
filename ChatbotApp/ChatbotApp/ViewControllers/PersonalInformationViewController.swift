//
//  PersonalInformationViewController.swift
//  ChatbotApp
//
//  Created by Yeon on 2021/06/01.
//

import UIKit
import Kommunicate

final class PersonalInformationViewController: UIViewController {
    private var loginView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 10
        return stackView
    }()
    
    private var kakaoLoginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemYellow
        return button
    }()
    
    private var naverLoginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemGreen
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLoginView()
    }
    
    private func configureLoginView() {
        view.addSubview(loginView)
        loginView.addSubview(verticalStackView)
        configureLoginButtons()
        
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            loginView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            loginView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            loginView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            verticalStackView.centerYAnchor.constraint(equalTo: loginView.centerYAnchor),
            verticalStackView.centerXAnchor.constraint(equalTo: loginView.centerXAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 20),
            verticalStackView.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -20)
        ])
    }
    
    private func configureLoginButtons() {
        verticalStackView.addArrangedSubview(kakaoLoginButton)
        verticalStackView.addArrangedSubview(naverLoginButton)
        
        kakaoLoginButton.setTitle("카카오로 로그인", for: .normal)
        kakaoLoginButton.titleLabel?.font = .preferredFont(forTextStyle: .headline)
        kakaoLoginButton.setTitleColor(.black, for: .normal)
        
        naverLoginButton.setTitle("네이버로 로그인", for: .normal)
        naverLoginButton.titleLabel?.font = .preferredFont(forTextStyle: .headline)
        naverLoginButton.setTitleColor(.white, for: .normal)
    }
}
