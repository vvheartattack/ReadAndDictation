//
//  HomeViewController.swift
//  ReadAndDictation
//
//  Created by 江美佳 on 2021/5/25.
//

import UIKit
import SnapKit
class HomeViewController: UIViewController {
    
    // MARK: - View Setup
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.alwaysBounceVertical = true
        scrollView.isScrollEnabled = true
        return scrollView
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
        
        self.view.addSubview(scrollView)
        scrollView.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
        
        scrollView.addSubview(scrollViewContentView)
        scrollViewContentView.snp.makeConstraints { (make) in
            make.leading.trailing.top.equalToSuperview().inset(16)
            make.bottom.equalToSuperview()
            make.width.equalTo(scrollView.snp.width).offset(-32)
            make.height.equalToSuperview()
//            make.centerX.equalToSuperview()
        }
//        let contentViewHeight = scrollViewContentView.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor)
//        contentViewHeight.priority = .defaultLow
        
        scrollViewContentView.addSubview(bookContentView)
        bookContentView.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
        }
        
        let homePageViewController = HomePageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: .none)
        addChild(homePageViewController)
        homePageViewController.didMove(toParent: self)
        scrollViewContentView.addSubview(homePageViewController.view)
        homePageViewController.view.snp.makeConstraints { (make) in
            make.top.equalTo(bookContentView.snp.bottom).offset(9)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
//        scrollViewContentView.setNeedsLayout()
//        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height + bookContentView.frame.height)
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
    
//    override func viewWillAppear(_ animated: Bool) {
//        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height + bookContentView.frame.height)
//    }

}
