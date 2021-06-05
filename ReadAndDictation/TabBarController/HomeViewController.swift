//
//  HomeViewController.swift
//  ReadAndDictation
//
//  Created by 江美佳 on 2021/5/25.
//

import UIKit
import SnapKit

protocol SubScrollViewDelegate {
    func subScrollViewDidScroll(_ subScrollView: UIScrollView)
}

protocol PageableViewController {
    var subScrollViews: [UIScrollView] { get }
    var currentSubScrollView: UIScrollView { get }
}

fileprivate class MyUIScrollView: UIScrollView, UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}

class HomeViewController: UIViewController {
    
    // MARK: - View Setup
    private var homePageViewController: HomePageViewController!
    
    lazy var mainScrollView: UIScrollView = {
        let mainScrollView = MyUIScrollView()
        mainScrollView.delegate = self
        mainScrollView.alwaysBounceVertical = true
        mainScrollView.isScrollEnabled = true
        mainScrollView.showsVerticalScrollIndicator = false
        return mainScrollView
    }()
    
    lazy var scrollViewContentView: UIView = {
        let scrollViewContentView = UIView()
        scrollViewContentView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return scrollViewContentView
    }()
    
    lazy var bookContentView: UIView = {
        let bookContentView = UIView()
        bookContentView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        bookContentView.addSubview(bookContentStack)
        bookContentStack.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        return bookContentView
    }()
    
    func setUpNavigationBarButtons() {
        // Set up leftBarButtonItem and rightBarButtonItem
        let leftNavigationButton = UIButton()
        leftNavigationButton.setImage(UIImage(named: "导航栏／标签／h64／活动／免费领会员"), for: .normal)
        leftNavigationButton.frame.size = CGSize(width: 120, height: 32)
        let leftItem = UIBarButtonItem(customView: leftNavigationButton)
        self.navigationItem.leftBarButtonItem = leftItem
        
        let rightNavigationButton = UIButton()
        rightNavigationButton.setImage(UIImage(named: "导航栏／icon／50＊50／相机"), for: .normal)
        rightNavigationButton.frame.size = CGSize(width: 32, height: 32)
        let rightItem = UIBarButtonItem(customView: rightNavigationButton)
        self.navigationItem.rightBarButtonItem = rightItem
    }
    
    func setUpLayout() {
        
        self.view.addSubview(mainScrollView)
        mainScrollView.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
        
        mainScrollView.addSubview(scrollViewContentView)
        scrollViewContentView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.width.equalTo(self.view.snp.width)
            make.height.equalTo(self.view.snp.height).priority(.low)
        }
        
        scrollViewContentView.addSubview(bookContentView)
        bookContentView.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview().inset(16)
        }
        
        let homePageViewController = HomePageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: .none)
        self.homePageViewController = homePageViewController
        homePageViewController.subScrollViewDelegate = self
        addChild(homePageViewController)
        homePageViewController.didMove(toParent: self)
        scrollViewContentView.addSubview(homePageViewController.view)
        homePageViewController.view.snp.makeConstraints { (make) in
            make.top.equalTo(bookContentView.snp.bottom).offset(9)
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(mainScrollView.snp.height)
        }
    }
    
    // MARK: - Internal Views Setup
    
    private lazy var bookContentStack: UIStackView = {
        // Set up bookContentStack
        let bookContentStack = UIStackView()
        bookContentStack.axis = .vertical
        bookContentStack.alignment = .fill
        bookContentStack.distribution = .fill
        bookContentStack.spacing = 16
        
        let bookContentLabel = UILabel()
        bookContentStack.addArrangedSubview(bookContentLabel)
        bookContentLabel.text = "课本内容"
        bookContentLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        bookContentLabel.textAlignment = .left
        
        bookContentStack.addArrangedSubview(bookContentImageViewStack)
        return bookContentStack
    }()
    
    /// 防止书写重复代码，通过 Model 生成视图
    private struct BookCardModel {
        var backgroundImageName: String
        var bookName: String
        var textbookVersion: String
    }
    
    private lazy var bookContentImageViewStack: UIStackView = {
        // Set up bookContentImageViewStack
        let bookContentImageViewStack = UIStackView()
        bookContentImageViewStack.axis = .horizontal
        bookContentImageViewStack.alignment = .fill
        bookContentImageViewStack.distribution = .fill
        bookContentImageViewStack.spacing = 9
        
        let chineseBookModel = BookCardModel(backgroundImageName: "左图", bookName: "语文课本", textbookVersion: "还没有选择教材")
        let englishBookModel = BookCardModel(backgroundImageName: "右图", bookName: "英语课本", textbookVersion: "还没有选择教材")
            
        bookContentImageViewStack.addArrangedSubview(generateBookCard(with: chineseBookModel))
        bookContentImageViewStack.addArrangedSubview(generateBookCard(with: englishBookModel))
        
        return bookContentImageViewStack
    }()
    
    private func generateBookCard(with model: BookCardModel) -> UIImageView {
        // Set up leftImageView
        let rootImageView = UIImageView()
        rootImageView.image = UIImage(named: model.backgroundImageName)
        rootImageView.clipsToBounds = true
        rootImageView.snp.makeConstraints { (make) in
            make.width.equalTo(rootImageView.snp.height).multipliedBy(167.0 / 120)
        }
        
        let textbookLabel = UILabel()
        rootImageView.addSubview(textbookLabel)
        textbookLabel.text = model.bookName
        textbookLabel.textColor = .white
        textbookLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textbookLabel.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(16)
        }
        
        let textbookVersionLabel = UILabel()
        rootImageView.addSubview(textbookVersionLabel)
        textbookVersionLabel.text = model.textbookVersion
        textbookVersionLabel.textColor = .white
        textbookVersionLabel.font = UIFont.systemFont(ofSize: 11, weight: .regular)
        textbookVersionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(textbookLabel.snp.bottom)
            make.leading.equalToSuperview().offset(16)
        }
        
        let startDicationImageView = UIImageView()
        rootImageView.addSubview(startDicationImageView)
        startDicationImageView.image = UIImage(named: "内容区／icon／32／前进")
        startDicationImageView.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-16)
            make.width.height.equalTo(16)
        }
        
        let startDictationLabel = UILabel()
        rootImageView.addSubview(startDictationLabel)
        startDictationLabel.text = "开始默写"
        startDictationLabel.textColor = .white
        startDictationLabel.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        startDictationLabel.snp.makeConstraints { (make) in
            make.trailing.equalTo(startDicationImageView.snp.leading).offset(-4)
            make.bottom.equalToSuperview().offset(-16)
        }
        
        return rootImageView
    }
    
    // MARK:- View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        setUpNavigationBarButtons()
        setUpLayout()
    }
}

extension HomeViewController: SubScrollViewDelegate {
    func subScrollViewDidScroll(_ subScrollView: UIScrollView) {
        let boundaryValue = CGFloat(Int(homePageViewController.view.frame.minY) - 1)
        let subScrollViews = homePageViewController.subScrollViews
        if mainScrollView.contentOffset.y < boundaryValue {
            subScrollViews.forEach { $0.contentOffset.y = 1 }
        }
    }
}

extension HomeViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let boundaryValue = CGFloat(Int(homePageViewController.view.frame.minY) - 1)
        
        let currentSubScrollView = homePageViewController.currentSubScrollView
        if currentSubScrollView.contentOffset.y > 1 || mainScrollView.contentOffset.y >= boundaryValue {
            mainScrollView.contentOffset.y = boundaryValue
        }
    }
}
