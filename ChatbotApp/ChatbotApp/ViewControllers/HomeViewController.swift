//
//  ViewController.swift
//  ChatbotApp
//
//  Created by Yeon on 2021/05/10.
//

import UIKit

var images = ["메인화면소식1", "메인화면소식2", "메인화면소식3", "메인화면소식4"]

final class HomeViewController: UIViewController {
    @IBOutlet private weak var nicknameLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var collectionView: UICollectionView!
    private var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.hidesForSinglePage = true
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        pageControl.currentPageIndicatorTintColor = UIColor.darkGray
        return pageControl
    }()
    private var viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindView()
    }
    
    private func bindView() {
        viewModel.nicknameLabelText.bind({ [weak self] text in
            DispatchQueue.main.async {
                self?.nicknameLabel.text = text
            }
        })
        
        viewModel.locationLabelText.bind({ [weak self] text in
            DispatchQueue.main.async {
                self?.locationLabel.text = text
            }
        })
        
        viewModel.bannerImages.bind({ [weak self] images in
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
                self?.pageControl.numberOfPages = images?.count ?? 0
            }
        })
    }
}

