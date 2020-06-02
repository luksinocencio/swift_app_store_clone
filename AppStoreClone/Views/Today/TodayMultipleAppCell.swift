//
//  TodayMultipleAppCell.swift
//  AppStoreClone
//
//  Created by Lucas Inocencio on 02/06/20.
//  Copyright © 2020 Lucas Inocencio. All rights reserved.
//

import UIKit

class TodayMultipleAppCell: UITableViewCell {
    
    var app: App? {
        didSet {
            if let app = app {
                iconImageView.sd_setImage(with: URL(string: app.iconeUrl), completed: nil)
                titleLabel.text = app.nome
                companyLabel.text = app.empresa
            }
        }
    }
    
    let iconImageView: UIImageView = .iconImageView(width: 48, height: 48)
    let titleLabel: UILabel = .textLabel(text: "App nome", fontSize: 16)
    let companyLabel: UILabel = .textLabel(text: "App empresa", fontSize: 14)
    let getButton: UIButton = .getButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let titleCompanyStackView = UIStackView(arrangedSubviews: [titleLabel, companyLabel])
        titleCompanyStackView.spacing = 4
        titleCompanyStackView.axis = .vertical
        
        let stackView = UIStackView(arrangedSubviews: [iconImageView, titleCompanyStackView, getButton])
        stackView.spacing = 16
        stackView.alignment = .center
        
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 14, left: 0, bottom: 14, right: 0))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}