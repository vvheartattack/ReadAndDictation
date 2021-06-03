//
//  MineTableViewCell.swift
//  ReadAndDictation
//
//  Created by 江美佳 on 2021/6/2.
//

import UIKit

class MineTableViewCell: UITableViewCell {
    lazy var cellImageView: UIImageView = {
        let cellImageView = UIImageView()
        self.contentView.addSubview(cellImageView)
        return cellImageView
    }()
    
    lazy var cellTitleLabel: UILabel = {
        let cellTitleLabel = UILabel()
        cellTitleLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        self.contentView.addSubview(cellTitleLabel)
        return cellTitleLabel
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    func layout() {
        cellImageView.snp.makeConstraints { (make) in
            make.leading.top.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().offset(-16)
            make.width.height.equalTo(24)
        }
        cellTitleLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(cellImageView.snp.trailing).offset(8)
            make.centerY.equalTo(cellImageView.snp.centerY)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
