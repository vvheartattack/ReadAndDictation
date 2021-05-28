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
//        blurEffectView.frame = view.bounds
//        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(blurEffectView)
        NSLayoutConstraint.activate([
            blurEffectView.topAnchor.constraint(equalTo: self.view.topAnchor),
            blurEffectView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            blurEffectView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            blurEffectView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        // Set up getWords part
        let getWordsLabel = UILabel()
        getWordsLabel.text = "荧光笔取词"
        getWordsLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        getWordsLabel.textColor = #colorLiteral(red: 0.1921568627, green: 0.2196078431, blue: 0.2117647059, alpha: 1)
        let getWordsButton = UIButton()
        getWordsButton.setImage(UIImage(named: "内容区／icon／120＊120／荧光笔取词"), for: .normal)
        getWordsLabel.translatesAutoresizingMaskIntoConstraints = false
        getWordsButton.translatesAutoresizingMaskIntoConstraints = false
        blurEffectView.contentView.addSubview(getWordsLabel)
        blurEffectView.contentView.addSubview(getWordsButton)
        NSLayoutConstraint.activate([
            getWordsLabel.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -126),
            getWordsButton.bottomAnchor.constraint(equalTo: getWordsLabel.topAnchor, constant: -12),
            getWordsButton.leadingAnchor.constraint(equalTo: blurEffectView.leadingAnchor, constant: 40),
            getWordsLabel.centerXAnchor.constraint(equalTo: getWordsButton.centerXAnchor)
        ])
        
        // Set up createAudio part
        let createAudioLabel = UILabel()
        createAudioLabel.text = "创建音频"
        createAudioLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        createAudioLabel.textColor = #colorLiteral(red: 0.1921568627, green: 0.2196078431, blue: 0.2117647059, alpha: 1)
        let createAudioButton = UIButton()
        createAudioButton.setImage(UIImage(named: "内容区／icon／120＊120／创建音频"), for: .normal)
        createAudioLabel.translatesAutoresizingMaskIntoConstraints = false
        createAudioButton.translatesAutoresizingMaskIntoConstraints = false
        blurEffectView.contentView.addSubview(createAudioButton)
        blurEffectView.contentView.addSubview(createAudioLabel)
        NSLayoutConstraint.activate([
            createAudioLabel.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -126),
            createAudioButton.bottomAnchor.constraint(equalTo: getWordsLabel.topAnchor, constant: -12),
            createAudioButton.trailingAnchor.constraint(equalTo: blurEffectView.trailingAnchor, constant: -40),
            createAudioLabel.centerXAnchor.constraint(equalTo: createAudioButton.centerXAnchor)
        ])
        
        // Set up createText part
        let createTextLabel = UILabel()
        createTextLabel.text = "创建音频"
        createTextLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        createTextLabel.textColor = #colorLiteral(red: 0.1921568627, green: 0.2196078431, blue: 0.2117647059, alpha: 1)
        let createTextButton = UIButton()
        createTextButton.setImage(UIImage(named: "内容区／icon／120＊120／创建文本"), for: .normal)
        createTextLabel.translatesAutoresizingMaskIntoConstraints = false
        createTextButton.translatesAutoresizingMaskIntoConstraints = false
        blurEffectView.contentView.addSubview(createTextButton)
        blurEffectView.contentView.addSubview(createTextLabel)
        NSLayoutConstraint.activate([
            createTextLabel.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -126),
            createTextButton.bottomAnchor.constraint(equalTo: getWordsLabel.topAnchor, constant: -12),
            createTextButton.centerXAnchor.constraint(equalTo: blurEffectView.centerXAnchor),
            createTextLabel.centerXAnchor.constraint(equalTo: createTextButton.centerXAnchor)
        ])
        
        // Set up dismissedButton
        let dismissedButton = UIButton()
        dismissedButton.setImage(UIImage(named: "内容区／icon／历史记录"), for: .normal)
        dismissedButton.translatesAutoresizingMaskIntoConstraints = false
        blurEffectView.contentView.addSubview(dismissedButton)
        NSLayoutConstraint.activate([
            dismissedButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            dismissedButton.centerXAnchor.constraint(equalTo: blurEffectView.centerXAnchor)
        ])
        dismissedButton.addTarget(self, action: #selector(dismissedButtonTapped(button:)), for: .touchUpInside)
        
        // Set up noticeButton
        let noticeButton = UIButton()
        noticeButton.setTitle("如何荧光笔取词？", for: .normal)
        noticeButton.titleLabel?.underline()
        noticeButton.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        noticeButton.setTitleColor(#colorLiteral(red: 0.5764705882, green: 0.5921568627, blue: 0.631372549, alpha: 1), for: .normal)
        noticeButton.translatesAutoresizingMaskIntoConstraints = false
        blurEffectView.contentView.addSubview(noticeButton)
        NSLayoutConstraint.activate([
            noticeButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -77),
            noticeButton.centerXAnchor.constraint(equalTo: blurEffectView.centerXAnchor)
        ])
        
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


