//
//  BookContentViewController.swift
//  ReadAndDictation
//
//  Created by 江美佳 on 2021/6/18.
//

import UIKit

class BookContentViewController: UIViewController {

//    lazy var returnBarButtonItem: UIBarButtonItem = {
//        let returnBarButtonItem = UIBarButtonItem()
//        returnBarButtonItem.image = UIImage(systemName: "arrow.backward")
//        return returnBarButtonItem
//    }()
    
    // navigation bar button item
    lazy var feedbackBarButtonItem: UIBarButtonItem = {
        let feedbackBarButtonItem = UIBarButtonItem()
        feedbackBarButtonItem.image = UIImage(systemName: "exclamationmark.triangle")
        return feedbackBarButtonItem
    }()
    lazy var listBarButtonItem: UIBarButtonItem = {
        let listBarButtonItem = UIBarButtonItem()
        listBarButtonItem.image = UIImage(systemName: "list.bullet")
        return listBarButtonItem
    }()
    
    func setUpNavigationBar() {
//        self.navigationItem.setLeftBarButton(returnBarButtonItem, animated: false)
        self.navigationItem.rightBarButtonItems = [feedbackBarButtonItem,listBarButtonItem]
    }
    
    lazy var customizeUploadView: UIView = {
        let customizeUploadView = UIView()
        customizeUploadView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        return customizeUploadView
    }()
    
    lazy var customizeUploadLabel: UILabel = {
        let customizeUploadLabel = UILabel()
        let attributedText = NSMutableAttributedString(string: "内容不全？试试自定义上传默写内容")
        customizeUploadLabel.font = UIFont.systemFont(ofSize: 15)
        customizeUploadLabel.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        attributedText.addAttributes([.foregroundColor: #colorLiteral(red: 0, green: 0.5019607843, blue: 1, alpha: 1)], range: NSRange(location: 7, length: 5))
        customizeUploadLabel.attributedText = attributedText
        return customizeUploadLabel
    }()
    
    lazy var customizeUploadImageView: UIImageView = {
        let customizeUploadImageView = UIImageView()
        customizeUploadImageView.image = UIImage(systemName: "highlighter")
        return customizeUploadImageView
    }()
        
    func setUpLayout() {
        customizeUploadView.addSubview(customizeUploadLabel)
        customizeUploadLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(16)
            
        }
        customizeUploadView.addSubview(customizeUploadImageView)
        customizeUploadImageView.snp.makeConstraints{ (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-16)
        }
        self.view.addSubview(customizeUploadView)
        customizeUploadView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(16)
            make.bottom.equalTo(customizeUploadLabel.snp.bottom).offset(16)
        }

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBar()
        setUpLayout()

        // Do any additional setup after loading the view.
    }

}
