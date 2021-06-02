//
//  MyPageViewController.swift
//  ReadAndDictation
//
//  Created by 江美佳 on 2021/5/25.
//

import UIKit

class MineViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = belowTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "hello,world!"
        // Add arrow on the right side of cells
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 56
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
        self.view.addSubview(basicView)
        basicView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.bottom.equalTo(self.view.snp.top).offset(231)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }

        // Set up above part of the view
        let avatarImageView = UIImageView()
        avatarImageView.image = UIImage(named: "头像")
        basicView.addSubview(avatarImageView)
        avatarImageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(80)
            make.leading.equalToSuperview().offset(16)
        }
        
        let userNameLabel = UILabel()
        userNameLabel.text = "OIHWDO123"
        userNameLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        basicView.addSubview(userNameLabel)
        userNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(avatarImageView.snp.top)
            make.leading.equalTo(avatarImageView.snp.trailing).offset(12)
        }

        let userNumberLabel = UILabel()
        userNumberLabel.text = "学号：182047"
        userNumberLabel.textColor = #colorLiteral(red: 0.5764705882, green: 0.5921568627, blue: 0.631372549, alpha: 1)
        userNumberLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        basicView.addSubview(userNumberLabel)
        userNumberLabel.snp.makeConstraints {(make) in
            make.leading.equalTo(userNameLabel.snp.leading)
            make.top.equalTo(userNameLabel.snp.bottom).offset(2)
        }
        
        let vipButton = UIButton()
        vipButton.setImage(UIImage(named: "矩形"), for: .normal)
        basicView.addSubview(vipButton)
        vipButton.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview()
            make.centerY.equalTo(avatarImageView.snp.centerY)
        }
        
        let dictationLabel = UILabel()
        dictationLabel.text = "默写"
        dictationLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        basicView.addSubview(dictationLabel)
        dictationLabel.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(168)
        }
        let dictationNumberLabel = UILabel()
        dictationNumberLabel.text = "16"
        dictationNumberLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        dictationNumberLabel.textColor = #colorLiteral(red: 0.5764705882, green: 0.5921568627, blue: 0.631372549, alpha: 1)
        basicView.addSubview(dictationNumberLabel)
        dictationNumberLabel.snp.makeConstraints { (make) in
            make.top.equalTo(dictationLabel.snp.bottom)
            make.leading.equalTo(dictationLabel.snp.leading)
            
        }
        
        let textLabel = UILabel()
        textLabel.text = "文本"
        textLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        basicView.addSubview(textLabel)
        textLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(dictationLabel.snp.trailing).offset(40)
            make.centerY.equalTo(dictationLabel.snp.centerY)
        }
        let textNumberLabel = UILabel()
        textNumberLabel.text = "32"
        textNumberLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        textNumberLabel.textColor = #colorLiteral(red: 0.5764705882, green: 0.5921568627, blue: 0.631372549, alpha: 1)
        basicView.addSubview(textNumberLabel)
        textNumberLabel.snp.makeConstraints { (make) in
            make.top.equalTo(textLabel.snp.bottom)
            make.leading.equalTo(textLabel.snp.leading)
        }
        
        let audioLabel = UILabel()
        audioLabel.text = "录音"
        audioLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        basicView.addSubview(audioLabel)
        audioLabel.snp.makeConstraints {(make) in
            make.leading.equalTo(textLabel.snp.trailing).offset(40)
            make.centerY.equalTo(dictationLabel.snp.centerY)
        }
        let audioNumberLabel = UILabel()
        audioNumberLabel.text = "7"
        audioNumberLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        audioNumberLabel.textColor = #colorLiteral(red: 0.5764705882, green: 0.5921568627, blue: 0.631372549, alpha: 1)
        basicView.addSubview(audioNumberLabel)
        audioNumberLabel.snp.makeConstraints { (make) in
            make.top.equalTo(audioLabel.snp.bottom)
            make.leading.equalTo(audioLabel.snp.leading)
        }

        
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
//        belowTableView.translatesAutoresizingMaskIntoConstraints = false
        belowTableView.snp.makeConstraints { (make) in
            make.top.equalTo(basicView.snp.bottom).offset(8)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        // 使得 tableView 下面为空，没有 cell 的横线
        belowTableView.tableFooterView = UIView(frame: CGRect.zero)
        
    }

}
