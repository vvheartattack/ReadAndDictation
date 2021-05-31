//
//  HomeViewController.swift
//  ReadAndDictation
//
//  Created by 江美佳 on 2021/5/25.
//

import UIKit
import SnapKit
class HomeViewController: UIViewController {

    func setUpNavigationBarButtons() {
        // Set up leftBarButtonItem and rightBarButtonItem
        
        //        let leftBarButton = UIBarButtonItem()
        //        leftBarButton.setBackgroundImage(UIImage(named: "导航栏／标签／h64／活动／免费领会员"), for: .normal, barMetrics: .default)
        //
        //        self.navigationItem.leftBarButtonItem = leftBarButton
        
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
        setUpUpperLayout()

    }
    
    func setUpUpperLayout() {
        let bookContentView = UIView()
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
        leftImageView.translatesAutoresizingMaskIntoConstraints = false
        rightImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
//            leftImageView.leadingAnchor.constraint(equalTo: bookContentImageViewStack.leadingAnchor),
//            leftImageView.trailingAnchor.constraint(equalTo: rightImageView.leadingAnchor),
            leftImageView.widthAnchor.constraint(equalTo: leftImageView.heightAnchor, multiplier: 167 / 120)
        ])
        NSLayoutConstraint.activate([
//            rightImageView.trailingAnchor.constraint(equalTo: bookContentImageViewStack.trailingAnchor),
//            rightImageView.leadingAnchor.constraint(equalTo: leftImageView.trailingAnchor),
            rightImageView.widthAnchor.constraint(equalTo: rightImageView.heightAnchor, multiplier: 167 / 120)
            
        ])
        rightImageView.translatesAutoresizingMaskIntoConstraints = false
        
        // Set up bookContentStack
        let bookContentStack = UIStackView()
        bookContentStack.axis = .vertical
        bookContentStack.alignment = .fill
        bookContentStack.distribution = .fill
        bookContentStack.addArrangedSubview(bookContentLabel)
        bookContentLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bookContentLabel.leadingAnchor.constraint(equalTo: bookContentStack.leadingAnchor)
        ])
        bookContentStack.addArrangedSubview(bookContentImageViewStack)
        
        bookContentStack.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(bookContentStack)
        NSLayoutConstraint.activate([
            bookContentStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            bookContentStack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            bookContentStack.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 16),
        ])
        bookContentStack.spacing = 16
        
//        bookContentView.translatesAutoresizingMaskIntoConstraints = false
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
        ChineseTextbookLabel.translatesAutoresizingMaskIntoConstraints = false
        leftTextbookVersionLabel.translatesAutoresizingMaskIntoConstraints = false
        leftImageView.addSubview(ChineseTextbookLabel)
        leftImageView.addSubview(leftTextbookVersionLabel)
        NSLayoutConstraint.activate([
            ChineseTextbookLabel.leadingAnchor.constraint(equalTo: leftImageView.leadingAnchor, constant: 16),
            ChineseTextbookLabel.topAnchor.constraint(equalTo: leftImageView.topAnchor,constant: 16),
            leftTextbookVersionLabel.topAnchor.constraint(equalTo: ChineseTextbookLabel.bottomAnchor),
            leftTextbookVersionLabel.leadingAnchor.constraint(equalTo: leftImageView.leadingAnchor, constant: 16),
        ])
        let leftStartDictationLabel = UILabel()
        leftStartDictationLabel.text = "开始默写"
        leftStartDictationLabel.textColor = .white
        leftStartDictationLabel.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        let leftStartDicationImageView = UIImageView()
        leftStartDicationImageView.image = UIImage(named: "内容区／icon／32／前进")
        leftImageView.addSubview(leftStartDictationLabel)
        leftImageView.addSubview(leftStartDicationImageView)
        leftStartDicationImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            leftStartDicationImageView.trailingAnchor.constraint(equalTo: leftImageView.trailingAnchor, constant: -16),
            leftStartDicationImageView.bottomAnchor.constraint(equalTo: leftImageView.bottomAnchor, constant: -16),
            leftStartDicationImageView.widthAnchor.constraint(equalTo: leftStartDicationImageView.heightAnchor),
            leftStartDicationImageView.widthAnchor.constraint(equalToConstant: 16)
        ])
        leftStartDictationLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            leftStartDictationLabel.trailingAnchor.constraint(equalTo: leftStartDicationImageView.leadingAnchor, constant: -4),
            leftStartDictationLabel.bottomAnchor.constraint(equalTo: leftImageView.bottomAnchor, constant: -16)
        ])
        
        // Set up rightImageView's Content
        let EnglishTextbookLabel = UILabel()
        EnglishTextbookLabel.text = "英语课本"
        EnglishTextbookLabel.textColor = .white
        EnglishTextbookLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        let EnglishTextbookVersionLabel = UILabel()
        EnglishTextbookVersionLabel.text = "还没有选择教材"
        EnglishTextbookVersionLabel.textColor = .white
        EnglishTextbookVersionLabel.font = UIFont.systemFont(ofSize: 11, weight: .regular)
        EnglishTextbookLabel.translatesAutoresizingMaskIntoConstraints = false
        EnglishTextbookVersionLabel.translatesAutoresizingMaskIntoConstraints = false
        rightImageView.addSubview(EnglishTextbookLabel)
        rightImageView.addSubview(EnglishTextbookVersionLabel)
        NSLayoutConstraint.activate([
            EnglishTextbookLabel.leadingAnchor.constraint(equalTo: rightImageView.leadingAnchor, constant: 16),
            EnglishTextbookLabel.topAnchor.constraint(equalTo: rightImageView.topAnchor,constant: 16),
            EnglishTextbookVersionLabel.topAnchor.constraint(equalTo: EnglishTextbookLabel.bottomAnchor),
            EnglishTextbookVersionLabel.leadingAnchor.constraint(equalTo: rightImageView.leadingAnchor, constant: 16),
        ])
        let rightStartDictationLabel = UILabel()
        rightStartDictationLabel.text = "开始默写"
        rightStartDictationLabel.textColor = .white
        rightStartDictationLabel.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        let rightStartDicationImageView = UIImageView()
        rightStartDicationImageView.image = UIImage(named: "内容区／icon／32／前进")
        rightImageView.addSubview(rightStartDictationLabel)
        rightImageView.addSubview(rightStartDicationImageView)
        rightStartDicationImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rightStartDicationImageView.trailingAnchor.constraint(equalTo: rightImageView.trailingAnchor, constant: -16),
            rightStartDicationImageView.bottomAnchor.constraint(equalTo: rightImageView.bottomAnchor, constant: -16),
            rightStartDicationImageView.widthAnchor.constraint(equalTo: leftStartDicationImageView.heightAnchor),
            rightStartDicationImageView.widthAnchor.constraint(equalToConstant: 16)
        ])
        rightStartDictationLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rightStartDictationLabel.trailingAnchor.constraint(equalTo: rightStartDicationImageView.leadingAnchor, constant: -4),
            rightStartDictationLabel.bottomAnchor.constraint(equalTo: rightImageView.bottomAnchor, constant: -16)
        ])
    }

}
