//
//  GenericRetryTableViewCell.swift
//  PagSeguro
//
//  Created by João Pedro on 22/01/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class GenericRetryTableViewCell: DefaultTableViewCell, Reusable {

    // MARK: - View's
    lazy var lblTitle: UILabel = UILabel() <-< {
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.textColor = .black
        $0.text = "Não foi possível carrergar as informações, tente novamente"
        $0.numberOfLines = 0
    }

    lazy var btnRetry: UIButton = UIButton() <-< {
        $0.setTitle("Tentar Novamente", for: .normal)
        $0.backgroundColor = .black
        $0.setTitleColor(.white, for: .normal)
        $0.cornerRadius = 10
    }

    // MARK: - Setup UI
    override func setupUI() {
        super.setupUI()
        contentView.addSubview(lblTitle)
        lblTitle.anchor(top: (anchor: contentView.topAnchor, padding: 22),
                       left: (anchor: contentView.leftAnchor, padding: 22),
                       right: (anchor: contentView.rightAnchor, padding: 22))

        contentView.addSubview(btnRetry)
        btnRetry.anchor(top: (anchor: lblTitle.bottomAnchor, padding: 22),
                       left: (anchor: contentView.leftAnchor, padding: 22),
                       right: (anchor: contentView.rightAnchor, padding: 22),
                       bottom: (anchor: contentView.bottomAnchor, padding: 22),
                       height: 50)
    }
}
