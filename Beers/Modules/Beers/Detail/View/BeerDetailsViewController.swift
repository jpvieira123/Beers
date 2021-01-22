//
//  BeerDetailsViewController.swift
//  PagSeguro
//
//  Created by João Pedro on 22/01/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class BeerDetailsViewController: DefaultViewController {

    // MARK: - View's
    lazy var imageView: ImageLoader = ImageLoader() <-< {
        $0.contentMode = .scaleAspectFit
    }
    
    lazy var lblName: UILabel = UILabel() <-< {
        $0.textAlignment = .center
        $0.font = UIFont.boldSystemFont(ofSize: 22)
        $0.numberOfLines = 0
    }
    
    lazy var lblTagline: UILabel = UILabel() <-< {
        $0.textAlignment = .center
        $0.font = UIFont.italicSystemFont(ofSize: 18)
        $0.numberOfLines = 0
    }
    
    lazy var lblAbv: UILabel = UILabel() <-< {
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.numberOfLines = 0
        $0.textAlignment = .left
    }

    lazy var lblIbu: UILabel = UILabel() <-< {
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.numberOfLines = 0
        $0.textAlignment = .right
    }
    
    lazy var lblDescription: UILabel = UILabel() <-< {
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.numberOfLines = 0
        $0.textAlignment = .left
    }

    // MARK: - Var's
    var interactor: BeerDetailsBusinessLogic?
    var router: (NSObjectProtocol & BeerDetailsRoutingLogic & BeerDetailsDataPassing)?
    
    // MARK: - Constructor
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    // MARK: - Setup UI
    override func setupUI() {
        super.setupUI()
        title = "Beer detail's"
        view.backgroundColor = .white
        view.addSubview(imageView)
        imageView.anchor(top: (anchor: view.safeAreaLayoutGuide.topAnchor, padding: 8),
                         left: (anchor: view.leftAnchor, padding: 0),
                         right: (anchor: view.rightAnchor, padding: 0),
                         height: 250)

        view.addSubview(lblName)
        lblName.anchor(top: (anchor: imageView.bottomAnchor, padding: 8),
                       left: (anchor: view.leftAnchor, padding: 16),
                       right: (anchor: view.rightAnchor, padding: 16))

        view.addSubview(lblTagline)
        lblTagline.anchor(top: (anchor: lblName.bottomAnchor, padding: 8),
                          left: (anchor: view.leftAnchor, padding: 16),
                          right: (anchor: view.rightAnchor, padding: 16))

        view.addSubview(lblAbv)
        lblAbv.anchor(top: (anchor: lblTagline.bottomAnchor, padding: 8),
                      left: (anchor: view.leftAnchor, padding: 16))

        view.addSubview(lblIbu)
        lblIbu.anchor(top: (anchor: lblTagline.bottomAnchor, padding: 8),
                      left: (anchor: lblAbv.rightAnchor, padding: 16),
                      right: (anchor: view.rightAnchor, padding: 16))

        view.addSubview(lblDescription)
        lblDescription.anchor(top: (anchor: lblAbv.bottomAnchor, padding: 32),
                              left: (anchor: view.leftAnchor, padding: 16),
                              right: (anchor: view.rightAnchor, padding: 16))
    }

    // MARK: - Appear
    override func viewDidApperFirstTime() {
        super.viewDidApperFirstTime()
        fetchBeer()
    }

    // MARK: - Auxiliary Func's
    func fetchBeer() {
        let request = BeerDetails.FetchBeer.Request()
        interactor?.fetchBeerDetail(request: request)
    }
}
