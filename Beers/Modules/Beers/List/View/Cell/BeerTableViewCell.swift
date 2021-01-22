//
//  BeerTableViewCell.swift
//  PagSeguro
//
//  Created by João Pedro on 21/01/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class BeerTableViewCell: DefaultTableViewCell, Reusable {

    // MARK: - View's
    lazy var imageViewIcon: ImageLoader = ImageLoader() <-< {
        $0.contentMode = .scaleAspectFit
    }

    lazy var lblName: UILabel = UILabel() <-< {
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.textColor = UIColor.black
        $0.text = " - "
        $0.textAlignment = .left
        $0.numberOfLines = 0
    }

    lazy var lblAbv: UILabel = UILabel() <-< {
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.textColor = UIColor.gray
        $0.textAlignment = .left
    }

    // MARK: - Var's
    var item: BeersList.Beers? {
        didSet {
            lblName.text = item?.name
            lblAbv.text = "Alcohol by volume: \(nullable: item?.abv)%"
            imageViewIcon.loadImage(urlString: item?.imageURL ?? "")
        }
    }

    // MARK: - Setup UI
    override func setupUI() {
        super.setupUI()
        selectionStyle = .none
        contentView.addSubview(imageViewIcon)
        imageViewIcon.anchor(top: (anchor: contentView.topAnchor, padding: 8),
                             left: (anchor: contentView.leftAnchor, padding: 8),
                             bottom: (anchor: contentView.bottomAnchor, padding: 0),
                             width: 100,
                             height: 100)

        contentView.addSubview(lblName)
        lblName.anchor(top: (anchor: contentView.topAnchor, padding: 8),
                       left: (anchor: imageViewIcon.rightAnchor, padding: 8),
                       right: (anchor: contentView.rightAnchor, padding: 0))

        contentView.addSubview(lblAbv)
        lblAbv.anchor(top: (anchor: lblName.bottomAnchor, padding: 8),
                       left: (anchor: imageViewIcon.rightAnchor, padding: 8),
                       right: (anchor: contentView.rightAnchor, padding: 0),
                       bottom: (anchor: contentView.bottomAnchor, padding: 8))
    }
}
