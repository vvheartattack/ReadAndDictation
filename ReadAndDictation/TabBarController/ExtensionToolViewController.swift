//
//  ExensionViewController.swift
//  ReadAndDictation
//
//  Created by 江美佳 on 2021/5/25.
//

import UIKit

class ExtensionToolViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLayout()

        // Do any additional setup after loading the view.
    }
    func setUpLayout(){
        // Make background look blur
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.systemUltraThinMaterialLight)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        self.view.addSubview(blurEffectView)
        blurEffectView.snp.makeConstraints { (make) in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
        // Set up getWords part
        let getWordsLabel = UILabel()
        getWordsLabel.text = "荧光笔取词"
        getWordsLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        getWordsLabel.textColor = #colorLiteral(red: 0.1921568627, green: 0.2196078431, blue: 0.2117647059, alpha: 1)
        let getWordsButton = UIButton()
        getWordsButton.setImage(UIImage(named: "内容区／icon／120＊120／荧光笔取词"), for: .normal)
        blurEffectView.contentView.addSubview(getWordsLabel)
        blurEffectView.contentView.addSubview(getWordsButton)
        getWordsButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(getWordsLabel.snp.top).offset(-12)
            make.leading.equalToSuperview().offset(40)
        }
        getWordsLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-126)
            make.centerX.equalTo(getWordsButton.snp.centerX)
        }
        
        // Set up createAudio part
        let createAudioLabel = UILabel()
        createAudioLabel.text = "创建音频"
        createAudioLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        createAudioLabel.textColor = #colorLiteral(red: 0.1921568627, green: 0.2196078431, blue: 0.2117647059, alpha: 1)
        let createAudioButton = UIButton()
        createAudioButton.setImage(UIImage(named: "内容区／icon／120＊120／创建音频"), for: .normal)
        blurEffectView.contentView.addSubview(createAudioButton)
        blurEffectView.contentView.addSubview(createAudioLabel)
        createAudioLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-126)
            make.centerX.equalTo(createAudioButton.snp.centerX)
        }
        createAudioButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(createAudioLabel.snp.top).offset(-12)
            make.trailing.equalToSuperview().offset(-40)
        }
        
        // Set up createText part
        let createTextLabel = UILabel()
        createTextLabel.text = "创建文本"
        createTextLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        createTextLabel.textColor = #colorLiteral(red: 0.1921568627, green: 0.2196078431, blue: 0.2117647059, alpha: 1)
        let createTextButton = UIButton()
        createTextButton.setImage(UIImage(named: "内容区／icon／120＊120／创建文本"), for: .normal)
        blurEffectView.contentView.addSubview(createTextButton)
        blurEffectView.contentView.addSubview(createTextLabel)
        createTextLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-126)
            make.centerX.equalTo(createTextButton.snp.centerX)
        }
        createTextButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(createTextLabel.snp.top).offset(-12)
            make.centerX.equalToSuperview()
        }

        // Set up dismissedButton
        let dismissedButton = UIButton()
        dismissedButton.setImage(UIImage(named: "内容区／icon／历史记录"), for: .normal)
        blurEffectView.contentView.addSubview(dismissedButton)
        dismissedButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-20)
            make.centerX.equalToSuperview()
        }
        dismissedButton.addTarget(self, action: #selector(dismissedButtonTapped(button:)), for: .touchUpInside)
        
        // Set up noticeButton
        let noticeButton = UIButton()
        noticeButton.setTitle("如何荧光笔取词？", for: .normal)
        noticeButton.titleLabel?.underline()
        noticeButton.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        noticeButton.setTitleColor(#colorLiteral(red: 0.5764705882, green: 0.5921568627, blue: 0.631372549, alpha: 1), for: .normal)

        blurEffectView.contentView.addSubview(noticeButton)
        noticeButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-77)
            make.centerX.equalToSuperview()
        }
        
    }
    
    @objc func dismissedButtonTapped(button: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

}

// Underline Text
extension UIButton {
    func underline() {
        guard let text = self.titleLabel?.text else { return }
        let attributedString = NSMutableAttributedString(string: text)
        //NSAttributedStringKey.foregroundColor : UIColor.blue
        attributedString.addAttribute(NSAttributedString.Key.underlineColor, value: self.titleColor(for: .normal)!, range: NSRange(location: 0, length: text.count))
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: self.titleColor(for: .normal)!, range: NSRange(location: 0, length: text.count))
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: text.count))
        self.setAttributedTitle(attributedString, for: .normal)
    }
}



extension UILabel {
    func underline() {
        if let textString = self.text {
            let attributedString = NSMutableAttributedString(string: textString)
            attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: attributedString.length - 1))
            attributedText = attributedString
        }
    }
}


