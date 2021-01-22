//
//  BeerEmptyTableViewCell.swift
//  PagSeguro
//
//  Created by João Pedro on 21/01/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class BeerEmptyTableViewCell: DefaultTableViewCell, Reusable {

    // MARK: - Views
    lazy var wrapperView: UIView =  UIView() <-< {
        $0.backgroundColor = .white
        $0.cornerRadius = 10
        $0.clipsToBounds = true
    }

    lazy var titleLabel: UILabel = UILabel() <-< {
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.textColor = .black
        $0.text = "Logo logo teremos produtos para você ;)"
        $0.numberOfLines = 0
    }

    // MARK: - Setup UI
    override func setupUI() {
        super.setupUI()
        contentView.backgroundColor = .clear
        selectionStyle = .none

        contentView.addSubview(wrapperView)
        wrapperView.anchor(top: (anchor: contentView.topAnchor, padding: 8),
                           left: (anchor: contentView.leftAnchor, padding: 20),
                           right: (anchor: contentView.rightAnchor, padding: 20),
                           bottom: (anchor: contentView.bottomAnchor, padding: 8))

        wrapperView.addSubview(titleLabel)
        titleLabel.anchor(top: (anchor: wrapperView.topAnchor, padding: 27),
                          left: (anchor: wrapperView.leftAnchor, padding: 32),
                          right: (anchor: wrapperView.rightAnchor, padding: 32),
                          bottom: (anchor: wrapperView.bottomAnchor, padding: 27))
    }
}
