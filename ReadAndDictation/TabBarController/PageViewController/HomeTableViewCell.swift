//
//  AfterSchoolTableViewCell.swift
//  ReadAndDictation
//
//  Created by 江美佳 on 2021/6/2.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    lazy var cellImageView: UIImageView = {
        let cellImageView = UIImageView()
//        cellImageView.clipsToBounds = true
//        cellImageView.contentMode = .scaleToFill
        self.contentView.addSubview(cellImageView)
        return cellImageView
    }()
    
    lazy var cellTitleLabel: UILabel = {
        let cellTitleLabel = UILabel()
        cellTitleLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        self.contentView.addSubview(cellTitleLabel)
        return cellTitleLabel
    }()
    
    lazy var cellDescriptionLabel: UILabel = {
        let cellDescriptionLabel = UILabel()
        cellDescriptionLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        cellDescriptionLabel.textColor = #colorLiteral(red: 0.7647058824, green: 0.7647058824, blue: 0.7647058824, alpha: 1)
        self.contentView.addSubview(cellDescriptionLabel)
        return cellDescriptionLabel
    }()
    
    lazy var cellStartDictationImageView: UIImageView = {
        let cellStartDictationImageView = UIImageView()
        cellStartDictationImageView.image = UIImage(named: "开始默写")
        self.contentView.addSubview(cellStartDictationImageView)
        return cellStartDictationImageView
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    func layout() {
        cellImageView.snp.makeConstraints { (make) in
            make.width.equalTo(120)
            make.height.equalTo(90)
            make.top.leading.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().offset(-16)
        }
        cellTitleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(16)
            make.leading.equalTo(cellImageView.snp.trailing).offset(8)
        }
        cellDescriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(cellTitleLabel.snp.bottom).offset(4)
            make.leading.equalTo(cellTitleLabel.snp.leading)
        }
        cellStartDictationImageView.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-16)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
