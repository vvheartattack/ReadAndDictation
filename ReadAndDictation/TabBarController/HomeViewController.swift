//
//  HomeViewController.swift
//  ReadAndDictation
//
//  Created by 江美佳 on 2021/5/25.
//

import UIKit
import SnapKit
class HomeViewController: UIViewController {
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        self.view.addSubview(scrollView)
        return scrollView
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBarButtons()
        setUpLayout()

    }
    
    func setUpLayout() {
        let bookContentView = UIView()
        self.view.backgroundColor = #colorLiteral(red: 0.9764705882, green: 0.9764705882, blue: 0.9764705882, alpha: 1)
        bookContentView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.view.addSubview(bookContentView)
        
        let bookContentLabel = UILabel()
        bookContentLabel.text = "课本内容"
        bookContentLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        
        // Set up leftImageView
        let leftImageView = UIImageView()
        leftImageView.image = UIImage(named: "左图")
        leftImageView.clipsToBounds = true
        
        // Set up rightImageView
        let rightImageView = UIImageView()
        rightImageView.image = UIImage(named: "右图")
        rightImageView.clipsToBounds = true
        
        // Set up bookContentImageViewStack
        let bookContentImageViewStack = UIStackView()
        bookContentImageViewStack.axis = .horizontal
        bookContentImageViewStack.alignment = .fill
        bookContentImageViewStack.distribution = .fillEqually
        bookContentImageViewStack.addArrangedSubview(leftImageView)
        bookContentImageViewStack.addArrangedSubview(rightImageView)
        bookContentImageViewStack.spacing = 9
        leftImageView.snp.makeConstraints { (make) in
            make.width.equalTo(leftImageView.snp.height).multipliedBy(167.0 / 120)
            make.leading.equalToSuperview()
        }
        rightImageView.snp.makeConstraints { (make) in
            make.width.equalTo(rightImageView.snp.height).multipliedBy(167.0 / 120)
            make.trailing.equalToSuperview()
            
        }

        
        // Set up bookContentStack
        let bookContentStack = UIStackView()
        bookContentStack.axis = .vertical
        bookContentStack.alignment = .fill
        bookContentStack.distribution = .fill
        bookContentStack.addArrangedSubview(bookContentLabel)
        bookContentLabel.snp.makeConstraints { (make) in
            make.leading.equalToSuperview()
        }
        bookContentStack.addArrangedSubview(bookContentImageViewStack)
        bookContentView.addSubview(bookContentStack)
        bookContentStack.snp.makeConstraints { (make) in
            make.leading.equalTo(self.view.snp.leading).offset(16)
            make.trailing.equalTo(self.view.snp.trailing).offset(-16)
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(16)
            make.bottom.equalToSuperview()
        }
        bookContentStack.spacing = 16
    
        self.view.addSubview(bookContentStack)
        
        // Set up leftImageView's Content
        let ChineseTextbookLabel = UILabel()
        ChineseTextbookLabel.text = "语文课本"
        ChineseTextbookLabel.textColor = .white
        ChineseTextbookLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        let leftTextbookVersionLabel = UILabel()
        leftTextbookVersionLabel.text = "还没有选择教材"
        leftTextbookVersionLabel.textColor = .white
        leftTextbookVersionLabel.font = UIFont.systemFont(ofSize: 11, weight: .regular)

        leftImageView.addSubview(ChineseTextbookLabel)
        leftImageView.addSubview(leftTextbookVersionLabel)
        ChineseTextbookLabel.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(16)
        }
        leftTextbookVersionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(ChineseTextbookLabel.snp.bottom)
            make.leading.equalToSuperview().offset(16)
        }
        
        let leftStartDictationLabel = UILabel()
        leftStartDictationLabel.text = "开始默写"
        leftStartDictationLabel.textColor = .white
        leftStartDictationLabel.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        let leftStartDicationImageView = UIImageView()
        leftStartDicationImageView.image = UIImage(named: "内容区／icon／32／前进")
        leftImageView.addSubview(leftStartDictationLabel)
        leftImageView.addSubview(leftStartDicationImageView)

        leftStartDicationImageView.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-16)
            make.width.height.equalTo(16)
        }
        
        leftStartDictationLabel.snp.makeConstraints { (make) in
            make.trailing.equalTo(leftStartDicationImageView.snp.leading).offset(-4)
            make.bottom.equalToSuperview().offset(-16)
        }
        
        // Set up rightImageView's Content
        let EnglishTextbookLabel = UILabel()
        EnglishTextbookLabel.text = "英语课本"
        EnglishTextbookLabel.textColor = .white
        EnglishTextbookLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        let EnglishTextbookVersionLabel = UILabel()
        EnglishTextbookVersionLabel.text = "还没有选择教材"
        EnglishTextbookVersionLabel.textColor = .white
        EnglishTextbookVersionLabel.font = UIFont.systemFont(ofSize: 11, weight: .regular)

        rightImageView.addSubview(EnglishTextbookLabel)
        rightImageView.addSubview(EnglishTextbookVersionLabel)
        
        EnglishTextbookLabel.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(16)
        }
        EnglishTextbookVersionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(EnglishTextbookLabel.snp.bottom)
            make.leading.equalToSuperview().offset(16)
        }

        let rightStartDictationLabel = UILabel()
        rightStartDictationLabel.text = "开始默写"
        rightStartDictationLabel.textColor = .white
        rightStartDictationLabel.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        let rightStartDicationImageView = UIImageView()
        rightStartDicationImageView.image = UIImage(named: "内容区／icon／32／前进")
        rightImageView.addSubview(rightStartDictationLabel)
        rightImageView.addSubview(rightStartDicationImageView)

        rightStartDicationImageView.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-16)
            make.width.height.equalTo(16)
        }

        rightStartDictationLabel.snp.makeConstraints { (make) in
            make.trailing.equalTo(rightStartDicationImageView.snp.leading).offset(-4)
            make.bottom.equalToSuperview().offset(-16)
        }
        bookContentView.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(bookContentStack.snp.bottom).offset(20)
        }
        
        let homePageView = HomePageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: .none)
        addChild(homePageView)
        self.view.addSubview(homePageView.view)
        homePageView.view.snp.makeConstraints { (make) in
            make.top.equalTo(bookContentView.snp.bottom).offset(9)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
        
    }

}
