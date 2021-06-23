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
        customizeUploadView.backgroundColor = #colorLiteral(red: 0.9763746858, green: 0.9765377641, blue: 0.9763532281, alpha: 1)
        customizeUploadView.addGestureRecognizer(customizeUploadViewRecognizer)
        return customizeUploadView
    }()
    
    lazy var customizeUploadViewRecognizer: UITapGestureRecognizer = {
        let customizeUploadViewRecognizer = UITapGestureRecognizer(target: self, action: #selector(customizeUploadViewTapped(_:)))
        return customizeUploadViewRecognizer
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
        
    lazy var lastLessonLabel: UILabel = {
       let lastLessonLabel = UILabel()
        lastLessonLabel.text = "上一课"
        lastLessonLabel.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        lastLessonLabel.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        return lastLessonLabel
    }()
    
    lazy var nextLessonLabel: UILabel = {
       let nextLessonLabel = UILabel()
        nextLessonLabel.text = "下一课"
        nextLessonLabel.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        nextLessonLabel.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        return nextLessonLabel
    }()
    
    lazy var playButton: UIButton = {
        let playButton  = UIButton()
        playButton.setImage(UIImage(named: "内容区／icon／历史记录-1"), for: .normal)
        
        return playButton
    }()
    
    lazy var playerSlider: UISlider = {
        let playerSlider = UISlider()
        return playerSlider
    }()
    
    lazy var currentTimeLabel: UILabel = {
        let currentTimeLabel = UILabel()
        currentTimeLabel.text = String(format: "%02d:%02d", 0, 0)
        currentTimeLabel.font = UIFont.systemFont(ofSize: 13)
        currentTimeLabel.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        return currentTimeLabel
    }()
    
    lazy var overallTimeLabel: UILabel = {
        let overallTimeLabel = UILabel()
        overallTimeLabel.text = String(format: "%02d:%02d", 0, 0)
        overallTimeLabel.font = UIFont.systemFont(ofSize: 13)
        overallTimeLabel.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        return overallTimeLabel
    }()
    
    lazy var middleScrollView: UIScrollView = {
        let middleScrollView = UIScrollView()
        return middleScrollView
    }()
    
    lazy var middleScrollContentView: UIView = {
       let middleScrollContentView = UIView()
        return middleScrollContentView
    }()
    
    lazy var audioControlView: UIView = {
        let audioControlView = UIView()
        return audioControlView
    }()
    
    lazy var audioGapView: UIView = {
        let audioGapView = UIView()
        audioGapView.backgroundColor = #colorLiteral(red: 0.9764705882, green: 0.9764705882, blue: 0.9764705882, alpha: 1)
        audioGapView.layer.cornerRadius = 10
        return audioGapView
    }()
    
    lazy var audioGapTitleLabel: UILabel = {
        let audioGapTitleLabel = UILabel()
        audioGapTitleLabel.text = "前后间隔"
        audioGapTitleLabel.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        audioGapTitleLabel.textColor = #colorLiteral(red: 0.3411764706, green: 0.3529411765, blue: 0.3803921569, alpha: 1)
        return audioGapTitleLabel
    }()
    
    lazy var repeatTimesView: UIView = {
        let repeatTimesView = UIView()
        repeatTimesView.backgroundColor = #colorLiteral(red: 0.9764705882, green: 0.9764705882, blue: 0.9764705882, alpha: 1)
        repeatTimesView.layer.cornerRadius = 10
        return repeatTimesView
    }()
    
    lazy var repeatTimesTitleLabel: UILabel = {
        let repeatTimesTitleLabel = UILabel()
        repeatTimesTitleLabel.text = "重复次数"
        repeatTimesTitleLabel.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        repeatTimesTitleLabel.textColor = #colorLiteral(red: 0.3411764706, green: 0.3529411765, blue: 0.3803921569, alpha: 1)
        return repeatTimesTitleLabel
    }()
    
    lazy var currentSpeedView: UIView = {
        let currentSpeedView = UIView()
        currentSpeedView.backgroundColor = #colorLiteral(red: 0.9764705882, green: 0.9764705882, blue: 0.9764705882, alpha: 1)
        currentSpeedView.layer.cornerRadius = 10
        return currentSpeedView
    }()
    
    lazy var currentSpeedTitleLabel: UILabel = {
        let currentSpeedTitleLabel = UILabel()
        currentSpeedTitleLabel.text = "当前倍速"
        currentSpeedTitleLabel.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        currentSpeedTitleLabel.textColor = #colorLiteral(red: 0.3411764706, green: 0.3529411765, blue: 0.3803921569, alpha: 1)
        return currentSpeedTitleLabel
    }()
    
    lazy var upDividingLineView: UIView = {
        let dividingLineView = dividingLine()
        return dividingLineView
    }()
    
    lazy var downDividingLineView: UIView = {
        let dividingLineView = dividingLine()
        return dividingLineView
    }()
    
    func dividingLine() -> UIView {
        let dividingLineView = UIView()
        dividingLineView.backgroundColor = #colorLiteral(red: 0.9098039216, green: 0.9098039216, blue: 0.9098039216, alpha: 1)
        return dividingLineView
    }
    
    func setUpAudioControlViewLayout() {
        audioControlView.addSubview(upDividingLineView)
        upDividingLineView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.height.equalTo(1)
            make.left.right.equalToSuperview()
        }
        
        audioControlView.addSubview(downDividingLineView)
        downDividingLineView.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview()
            make.height.equalTo(1)
            make.left.right.equalToSuperview()
        }
        
        audioGapView.addSubview(audioGapTitleLabel)
        audioGapTitleLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(audioGapView.snp.top).offset(11)
        }
        
        repeatTimesView.addSubview(repeatTimesTitleLabel)
        repeatTimesTitleLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(repeatTimesView.snp.top).offset(11)
        }
        
        currentSpeedView.addSubview(currentSpeedTitleLabel)
        currentSpeedTitleLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(currentSpeedView.snp.top).offset(11)
        }
        
        audioControlView.addSubview(audioGapView)
        audioGapView.snp.makeConstraints { (make) in
            make.top.equalTo(upDividingLineView.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(16)
            make.width.equalTo(105)
            make.height.equalTo(56)
        }
        
        audioControlView.addSubview(repeatTimesView)
        repeatTimesView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(audioGapView.snp.top)
            make.width.equalTo(105)
            make.height.equalTo(56)
        }
        
        audioControlView.addSubview(currentSpeedView)
        currentSpeedView.snp.makeConstraints { (make) in
            make.right.equalToSuperview().inset(16)
            make.top.equalTo(audioGapView.snp.top)
            make.width.equalTo(105)
            make.height.equalTo(56)
        }
    }
    
    func setUpLayout() {
        self.view.backgroundColor  = .white
        
        customizeUploadView.addSubview(customizeUploadLabel)
        customizeUploadLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(16)
            
        }
        
        customizeUploadView.addSubview(customizeUploadImageView)
        customizeUploadImageView.snp.makeConstraints{ (make) in
            make.centerY.equalTo(customizeUploadLabel.snp.centerY)
            make.right.equalToSuperview().offset(-16)
        }
        
        self.view.addSubview(customizeUploadView)
        customizeUploadView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(16)
            make.bottom.equalTo(customizeUploadLabel.snp.bottom).offset(10)
            make.left.right.equalToSuperview().inset(16)
        }
        
        self.view.addSubview(lastLessonLabel)
        lastLessonLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(16)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-16)
        }
        
        self.view.addSubview(nextLessonLabel)
        nextLessonLabel.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-16)
        }
        
        self.view.addSubview(playButton)
        playButton.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(lastLessonLabel.snp.centerY)
//            make.width.height.equalTo(50)
        }
        
        self.view.addSubview(currentTimeLabel)
        currentTimeLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(16)
            make.bottom.equalTo(playButton.snp.top).offset(-20)
        }
        
        self.view.addSubview(overallTimeLabel)
        overallTimeLabel.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-16)
            make.centerY.equalTo(currentTimeLabel.snp.centerY)
        }
        
        self.view.addSubview(playerSlider)
        playerSlider.snp.makeConstraints { (make) in
            make.centerY.equalTo(currentTimeLabel.snp.centerY)
            make.left.equalTo(currentTimeLabel.snp.right).offset(2)
            make.right.equalTo(overallTimeLabel.snp.left).offset(-2)
        }
        
        setUpAudioControlViewLayout()
        middleScrollContentView.addSubview(audioControlView)
        audioControlView.snp.makeConstraints { (make) in
            make.height.equalTo(88)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        middleScrollView.addSubview(middleScrollContentView)
        middleScrollContentView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            // 设置 Scroll View 的 content size
            make.width.equalTo(middleScrollView.snp.width)
            make.height.equalTo(middleScrollView.snp.height).priority(.low)
            
        }
        
        self.view.addSubview(middleScrollView)
        middleScrollView.snp.makeConstraints { (make) in
            make.top.equalTo(customizeUploadView.snp.bottom).offset(2)
            make.bottom.equalTo(playerSlider.snp.top).offset(-16)
            make.left.right.equalToSuperview()
        }
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBar()
        setUpLayout()

        // Do any additional setup after loading the view.
    }

}

extension BookContentViewController {
    @objc func customizeUploadViewTapped(_ recognizer: UITapGestureRecognizer) {
        let extensionToolViewController = ExtensionToolViewController()
        extensionToolViewController.modalPresentationStyle = .overFullScreen
        extensionToolViewController.modalTransitionStyle = .coverVertical
        self.present(extensionToolViewController, animated: true, completion: nil)
    }
}
