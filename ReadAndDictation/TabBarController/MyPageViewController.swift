//
//  MyPageViewController.swift
//  ReadAndDictation
//
//  Created by 江美佳 on 2021/5/25.
//

import UIKit

class MyPageViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = belowTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "hello,world"
        return cell
    }
    
    private let belowTableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLayout()

        // Do any additional setup after loading the view.
    }
    
    func setUpLayout() {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.view.backgroundColor = #colorLiteral(red: 0.9764705882, green: 0.9764705882, blue: 0.9764705882, alpha: 1)
        // Set up basicView
        let basicView = UIView()
        basicView.backgroundColor = .white
        basicView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(basicView)
        NSLayoutConstraint.activate([
            basicView.topAnchor.constraint(equalTo: self.view.topAnchor),
            basicView.bottomAnchor.constraint(equalTo: self.view.topAnchor, constant: 231),
            basicView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            basicView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        ])
        // Set up above part of the view
        let avatarImageView = UIImageView()
        avatarImageView.image = UIImage(named: "头像")
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        basicView.addSubview(avatarImageView)
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: basicView.topAnchor, constant: 80),
            avatarImageView.leadingAnchor.constraint(equalTo: basicView.leadingAnchor, constant: 16),
        ])
        
        let userNameLabel = UILabel()
        userNameLabel.text = "OIHWDO123"
        userNameLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        basicView.addSubview(userNameLabel)
        NSLayoutConstraint.activate([
            userNameLabel.topAnchor.constraint(equalTo: avatarImageView.topAnchor),
            userNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 12)
        ])
        
        let userNumberLabel = UILabel()
        userNumberLabel.text = "学号：182047"
        userNumberLabel.textColor = #colorLiteral(red: 0.5764705882, green: 0.5921568627, blue: 0.631372549, alpha: 1)
        userNumberLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        userNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        basicView.addSubview(userNumberLabel)
        NSLayoutConstraint.activate([
            userNumberLabel.leadingAnchor.constraint(equalTo: userNameLabel.leadingAnchor),
            userNumberLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 2
            )
        ])
        
        let vipButton = UIButton()
        vipButton.setImage(UIImage(named: "矩形"), for: .normal)
        vipButton.translatesAutoresizingMaskIntoConstraints = false
        basicView.addSubview(vipButton)
        NSLayoutConstraint.activate([
            vipButton.trailingAnchor.constraint(equalTo: basicView.trailingAnchor),
            vipButton.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor
            )
        ])
        
        let dictationLabel = UILabel()
        dictationLabel.text = "默写"
        dictationLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        dictationLabel.translatesAutoresizingMaskIntoConstraints = false
        basicView.addSubview(dictationLabel)
        NSLayoutConstraint.activate([
            dictationLabel.leadingAnchor.constraint(equalTo: basicView.leadingAnchor, constant: 20),
            dictationLabel.topAnchor.constraint(equalTo: basicView.topAnchor, constant: 168)
        ])
        let dictationNumberLabel = UILabel()
        dictationNumberLabel.text = "16"
        dictationNumberLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        dictationNumberLabel.textColor = #colorLiteral(red: 0.5764705882, green: 0.5921568627, blue: 0.631372549, alpha: 1)
        dictationNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        basicView.addSubview(dictationNumberLabel)
        NSLayoutConstraint.activate([
            dictationNumberLabel.topAnchor.constraint(equalTo: dictationLabel.bottomAnchor),
            dictationNumberLabel.leadingAnchor.constraint(equalTo: dictationLabel.leadingAnchor)
        ])
        
        let textLabel = UILabel()
        textLabel.text = "文本"
        textLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        basicView.addSubview(textLabel)
        NSLayoutConstraint.activate([
            textLabel.leadingAnchor.constraint(equalTo: dictationLabel.trailingAnchor, constant: 40),
            textLabel.centerYAnchor.constraint(equalTo: dictationLabel.centerYAnchor)
        ])
        let textNumberLabel = UILabel()
        textNumberLabel.text = "32"
        textNumberLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        textNumberLabel.textColor = #colorLiteral(red: 0.5764705882, green: 0.5921568627, blue: 0.631372549, alpha: 1)
        textNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        basicView.addSubview(textNumberLabel)
        NSLayoutConstraint.activate([
            textNumberLabel.topAnchor.constraint(equalTo: textLabel.bottomAnchor),
            textNumberLabel.leadingAnchor.constraint(equalTo: textLabel.leadingAnchor)
        ])
        
        let audioLabel = UILabel()
        audioLabel.text = "录音"
        audioLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        audioLabel.translatesAutoresizingMaskIntoConstraints = false
        basicView.addSubview(audioLabel)
        NSLayoutConstraint.activate([
            audioLabel.leadingAnchor.constraint(equalTo: textLabel.trailingAnchor, constant: 40),
            audioLabel.centerYAnchor.constraint(equalTo: dictationLabel.centerYAnchor)
        ])
        let audioNumberLabel = UILabel()
        audioNumberLabel.text = "7"
        audioNumberLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        audioNumberLabel.textColor = #colorLiteral(red: 0.5764705882, green: 0.5921568627, blue: 0.631372549, alpha: 1)
        audioNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        basicView.addSubview(audioNumberLabel)
        NSLayoutConstraint.activate([
            audioNumberLabel.topAnchor.constraint(equalTo: audioLabel.bottomAnchor),
            audioNumberLabel.leadingAnchor.constraint(equalTo: audioLabel.leadingAnchor)
        ])
        
        // Set up below part of the view
        // Set up vipCenterView
//        let vipCenterView = UIView()
//        vipCenterView.translatesAutoresizingMaskIntoConstraints = false
//        self.view.addSubview(vipCenterView)
//        NSLayoutConstraint.activate([
//            vipCenterView.topAnchor.constraint(equalTo: dividingLineView.bottomAnchor),
//            vipCenterView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
//            vipCenterView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
//            vipCenterView.heightAnchor.constraint(equalToConstant: 56)
//        ])
//        let vipCenterImageView = UIImageView()
//        vipCenterImageView.image = UIImage(named: "vipCenterIcon")
//        vipCenterImageView.translatesAutoresizingMaskIntoConstraints = false
//        vipCenterView.addSubview(vipCenterImageView)
//        NSLayoutConstraint.activate([
//            vipCenterImageView.leadingAnchor.constraint(equalTo: vipCenterView.leadingAnchor, constant: 16),
//            vipCenterImageView.topAnchor.constraint(equalTo: vipCenterView.topAnchor, constant: 16)
//        ])
        
        // Set up belowTableView
        belowTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        belowTableView.delegate = self
        belowTableView.dataSource = self
        self.view.addSubview(belowTableView)
        belowTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            belowTableView.topAnchor.constraint(equalTo: basicView.bottomAnchor, constant: 8),
            self.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            belowTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            belowTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            belowTableView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
        ])
        
        
    }

}
