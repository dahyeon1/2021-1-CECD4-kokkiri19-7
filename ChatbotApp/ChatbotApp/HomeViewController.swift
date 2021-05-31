//
//  ViewController.swift
//  ChatbotApp
//
//  Created by Yeon on 2021/05/10.
//

import UIKit

var images = ["메인화면 소식1", "메인화면 소식2", "메인화면 소식3", "메인화면 소식4"]

class HomeViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHomeViewControllerBackground()
        setupPageControl()
        setupSwipeGesture()
    }
    
    private func setupHomeViewControllerBackground() {
        self.view.backgroundColor = UIColor.chatBackgroundEnd
    }
    
    private func setupPageControl() {
        pageControl.numberOfPages = images.count
        pageControl.currentPage = 0
        
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        pageControl.currentPageIndicatorTintColor = UIColor.black
        imageView.image = UIImage(named: images[0])
    }
    
    private func setupSwipeGesture() {
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(HomeViewController.respondToSwipeGesture(_:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(HomeViewController.respondToSwipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
    }
    
    /// Check gesture whether direction is right or left
    /// Right: next page
    /// Left: before page
    /// - Parameter gesture: user's gesture
    @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.left:
                pageControl.currentPage -= 1
            case UISwipeGestureRecognizer.Direction.right:
                pageControl.currentPage += 1
            default:
                break
            }
            imageView.image = UIImage(named: images[pageControl.currentPage])
        }
    }
    
    @IBAction func pageChanged(_ sender: UIPageControl) {
        imageView.image = UIImage(named: images[pageControl.currentPage])
    }
}

