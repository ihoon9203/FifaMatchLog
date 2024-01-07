//
//  AddUserTableViewCell.swift
//  FifaMatchReport
//
//  Created by Runnan Oh on 1/7/24.
//

import UIKit
import SnapKit

class AddUserTableViewCell: UITableViewCell {
    let addIcon: UIImageView = {
        let iconView = UIImageView()
        iconView.tintColor = .white
        iconView.image = UIImage(named: "plus")!
        return iconView
    }()
    let label: UILabel = {
        let label = UILabel()
        label.text = "유저 추가"
        label.textColor = .white
        return label
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = ColorSets.themeColor
        placeLayout()
    }
    
    func placeLayout() {
        addSubview(addIcon)
        addSubview(label)
        addIcon.snp.makeConstraints { make in
            make.width.height.equalTo(20)
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(5)
        }
        label.snp.makeConstraints { make in
            make.leading.equalTo(addIcon.snp.trailing).offset(5)
            make.centerY.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
