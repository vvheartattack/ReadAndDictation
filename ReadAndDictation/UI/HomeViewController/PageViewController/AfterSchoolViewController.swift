//
//  AfterSchoolViewController.swift
//  ReadAndDictation
//
//  Created by 江美佳 on 2021/6/1.
//

import UIKit

class AfterSchoolViewController: UIViewController {
    
    lazy var afterSchoolTableView: UITableView = {
        let afterSchoolTableView = UITableView()
        self.view.addSubview(afterSchoolTableView)
        afterSchoolTableView.register(HomeTableViewCell.self, forCellReuseIdentifier: "cell")
        afterSchoolTableView.tableFooterView = UIView(frame: CGRect.zero)
        return afterSchoolTableView
    }()
    
    
    func setUp() {
        afterSchoolTableView.snp.makeConstraints { (make) in
            make.leading.bottom.trailing.equalToSuperview()
            make.top.equalToSuperview().offset(49)
        }
        
        afterSchoolTableView.delegate = self
        afterSchoolTableView.dataSource = self
        
        // 禁止 afterSchoolTableView 滚动
        afterSchoolTableView.isScrollEnabled = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
        
    }
}
extension AfterSchoolViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let bookContentVC = BookContentViewController()
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.pushViewController(bookContentVC, animated: true)
    }
}

extension AfterSchoolViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "cell"
        let cell = afterSchoolTableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! HomeTableViewCell
        let titleGroup = ["小学生古诗词诵读", "青少年古诗拓展诵读","小学生古诗词诵读", "青少年古诗拓展诵读"]
        let descriptionGroup = ["小学生必备课外补充金牌读物", "青少年实用古诗集合","小学生必备课外补充金牌读物", "青少年实用古诗集合"]
        let imageGroup = [UIImage(named: "左图"), UIImage(named: "右图"),UIImage(named: "左图"), UIImage(named: "右图")]
        cell.cellTitleLabel.text = titleGroup[indexPath.row]
        cell.cellDescriptionLabel.text = descriptionGroup[indexPath.row]
        cell.cellImageView.image = imageGroup[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 122
    }
    
}
