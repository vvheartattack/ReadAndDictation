//
//  LoginViewController.swift
//  ReadAndDictation
//
//  Created by 江美佳 on 2021/6/11.
//

import UIKit

class LoginViewController: UIViewController {
    lazy var disMissButton: UIButton = {
        let disMissButton = UIButton()
        disMissButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        disMissButton.tintColor = #colorLiteral(red: 0.7647058824, green: 0.7647058824, blue: 0.7647058824, alpha: 1)
        disMissButton.addTarget(self, action: #selector(disMissButtonTapped(button:)), for: .touchUpInside)
        return disMissButton
    }()
    
    lazy var visitorLoginLabel: UILabel = {
        let visitorLoginLabel = UILabel()
        visitorLoginLabel.text = "游客登录"
        visitorLoginLabel.font = UIFont.systemFont(ofSize: 15)
        visitorLoginLabel.textColor = #colorLiteral(red: 0.7647058824, green: 0.7647058824, blue: 0.7647058824, alpha: 1)
        return visitorLoginLabel
    }()
    
    lazy var topStack: UIStackView = {
        let topStack = UIStackView()
        topStack.axis = .horizontal
        topStack.alignment = .fill
        topStack.distribution = .equalSpacing
        return topStack
    }()
    
    lazy var loginWithPhoneNumbersLabel: UILabel = {
        let loginWithPhoneNumbersLabel = UILabel()
        loginWithPhoneNumbersLabel.text = "手机号登录"
        loginWithPhoneNumbersLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        return loginWithPhoneNumbersLabel
    }()
    
    lazy var phoneNumberView: UIView = {
        let phoneNumberView = UIView()
        phoneNumberView.layer.cornerRadius = 20
        phoneNumberView.backgroundColor = #colorLiteral(red: 0.9763746858, green: 0.9765377641, blue: 0.9763532281, alpha: 1)
        return phoneNumberView
    }()
    
    lazy var prefixOfNumbersLabel: UILabel = {
        let prefixOfNumbersLabel = UILabel()
        prefixOfNumbersLabel.text = "+86"
        prefixOfNumbersLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium
        )
        prefixOfNumbersLabel.textColor = #colorLiteral(red: 0.2509803922, green: 0.2588235294, blue: 0.2823529412, alpha: 1)
        return prefixOfNumbersLabel
    }()
    
    lazy var phoneNumberTextField: UITextField = {
        let phoneNumberTextField = UITextField()
        phoneNumberTextField.placeholder = "请输入手机号码"
        phoneNumberTextField.textAlignment = .left
        phoneNumberTextField.font = UIFont.systemFont(ofSize: 12)
//        phoneNumberView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        return phoneNumberTextField
    }()
    
    lazy var vertifyCodeTextField: UITextField = {
        let vertifyCodeTextField = UITextField()
        vertifyCodeTextField.placeholder = "请输入验证码"
        vertifyCodeTextField.textAlignment = .left
        vertifyCodeTextField.font = UIFont.systemFont(ofSize: 12)
//        phoneNumberView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        return vertifyCodeTextField
    }()
    
    lazy var getVertifyCodeButton: UIButton = {
        let getVertifyCodeButton = UIButton()
        getVertifyCodeButton.setTitle("获取验证码", for: .normal)
        getVertifyCodeButton.setTitleColor(#colorLiteral(red: 0, green: 0.5019607843, blue: 1, alpha: 1), for: .normal)
        getVertifyCodeButton.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        getVertifyCodeButton.setContentHuggingPriority(.required, for: .horizontal)
        getVertifyCodeButton.setContentCompressionResistancePriority(.required, for: .horizontal)
        return getVertifyCodeButton
    }()
    
    lazy var vertifyView: UIView = {
        let vertifyView = UIView()
        vertifyView.layer.cornerRadius = 20
        vertifyView.backgroundColor = #colorLiteral(red: 0.9763746858, green: 0.9765377641, blue: 0.9763532281, alpha: 1)
        return vertifyView
    }()
    
    lazy var loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.setTitle("确认登录", for: .normal)
        loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        loginButton.titleLabel?.textColor = .white
        loginButton.backgroundColor = #colorLiteral(red: 0, green: 0.5019607843, blue: 1, alpha: 1)
        loginButton.layer.cornerRadius = 20
        return loginButton
    }()
    
    lazy var agreementAndClauseTextView: UITextView = {
        let agreementAndClauseTextView = UITextView()
        agreementAndClauseTextView.isScrollEnabled = false
        let mutableText =  NSMutableAttributedString(string: "阅读并同意用户协议&隐私条款")
        agreementAndClauseTextView.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        agreementAndClauseTextView.textColor = #colorLiteral(red: 0.7647058824, green: 0.7647058824, blue: 0.7647058824, alpha: 1)
        
        mutableText.addAttributes([.link: "https://www.baidu.com/"], range: _NSRange(location: 5, length: 4))
        mutableText.addAttributes([.link: ""], range: _NSRange(location: 10, length: 4))
        agreementAndClauseTextView.attributedText = mutableText
        return agreementAndClauseTextView
    }()
    
    lazy var checkBoxButton: UIButton = {
        let checkBoxButton = UIButton()
        checkBoxButton.setImage(UIImage(systemName: "checkmark.circle.fill"), for: UIControl.State.selected)
        checkBoxButton.setImage(UIImage(systemName: "circlebadge"), for: UIControl.State.normal)
        checkBoxButton.addTarget(self, action: #selector(checkBoxToggle(button:)), for: .touchUpInside)
        return checkBoxButton
    }()
    
    
    func setUpUI() {
        topStack.addArrangedSubview(disMissButton)
        topStack.addArrangedSubview(visitorLoginLabel)
        
        self.view.addSubview(topStack)
        topStack.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(16)
            make.leading.trailing.equalToSuperview().inset(15)
        }
        
        phoneNumberView.addSubview(prefixOfNumbersLabel)
        // 设置抗拉伸优先级
        prefixOfNumbersLabel.setContentHuggingPriority(.required, for: .horizontal)
        // 设置抗压缩优先级
        prefixOfNumbersLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
        prefixOfNumbersLabel.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(20)
            make.centerY.equalToSuperview()
        }
        
        phoneNumberView.addSubview(phoneNumberTextField)
        phoneNumberTextField.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.leading.equalTo(prefixOfNumbersLabel.snp.trailing).offset(20)
            make.trailing.equalToSuperview()
        }
        
        self.view.addSubview(loginWithPhoneNumbersLabel)
        loginWithPhoneNumbersLabel.snp.makeConstraints { (make) in
            make.top.equalTo(topStack.snp.bottom).offset(40)
            make.leading.trailing.equalToSuperview().inset(35)
        }
        
        self.view.addSubview(phoneNumberView)
        phoneNumberView.snp.makeConstraints { (make) in
            make.top.equalTo(loginWithPhoneNumbersLabel.snp.bottom).offset(40)
            make.height.equalTo(40)
            make.leading.trailing.equalToSuperview().inset(35)
        }
        
       
        
        self.view.addSubview(vertifyView)
        vertifyView.snp.makeConstraints { (make) in
            make.top.equalTo(phoneNumberView.snp.bottom).offset(20)
            make.height.equalTo(40)
            make.leading.trailing.equalToSuperview().inset(35)
        }
        
        vertifyView.addSubview(getVertifyCodeButton)
        
        getVertifyCodeButton.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-20)
        }
        
        vertifyView.addSubview(vertifyCodeTextField)
        vertifyCodeTextField.snp.makeConstraints { (make) in
            make.leading.equalTo(phoneNumberTextField.snp.leading)
            make.centerY.equalToSuperview()
            make.trailing.equalTo(getVertifyCodeButton.snp.leading).offset(-20)
        }
        
        self.view.addSubview(loginButton)
        loginButton.snp.makeConstraints { (make) in
            make.top.equalTo(vertifyView.snp.bottom).offset(30)
            make.height.equalTo(40)
            make.leading.trailing.equalToSuperview().inset(35)
        }
        
        self.view.addSubview(agreementAndClauseTextView)
        agreementAndClauseTextView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(loginButton.snp.bottom).offset(20)
            
        }
        
        self.view.addSubview(checkBoxButton)
        checkBoxButton.snp.makeConstraints { (make)in
            make.trailing.equalTo(agreementAndClauseTextView.snp.leading)
            make.centerY.equalTo(agreementAndClauseTextView.snp.centerY)
            make.width.height.equalTo(14)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        // Do any additional setup after loading the view.
    }
    
}

extension LoginViewController {
    @objc func disMissButtonTapped(button: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func checkBoxToggle(button: UIButton){
        checkBoxButton.isSelected = !checkBoxButton.isSelected
    }
}

extension LoginViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        UIApplication.shared.open(URL, options: [:], completionHandler: nil)
        return false
    }
}

//extension UIButton: UIControl {
//
//}
