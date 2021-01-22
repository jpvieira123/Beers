//
//  BeerDetailsViewController+DisplayLogic.swift
//  PagSeguro
//
//  Created by João Pedro on 22/01/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol BeerDetailsDisplayLogic: class {
    func displaySuccessFetchBeer(viewModel: BeerDetails.FetchBeer.ViewModel.Success)
    func displayFailureFetchBeer(viewModel: BeerDetails.FetchBeer.ViewModel.Failure)
}

extension BeerDetailsViewController: BeerDetailsDisplayLogic {
    func displaySuccessFetchBeer(viewModel: BeerDetails.FetchBeer.ViewModel.Success) {
        imageView.loadImage(urlString: viewModel.beer.imageURL)
        lblName.text = viewModel.beer.name
        lblTagline.text = viewModel.beer.tagline
        lblAbv.text = "Alcohol by volume: \(viewModel.beer.abv)%"
        lblIbu.text = viewModel.beer.ibu != nil ? "International Bitternerss Units: \(nullable: viewModel.beer.ibu)%" : ""
        lblDescription.text = viewModel.beer.description
    }

    func displayFailureFetchBeer(viewModel: BeerDetails.FetchBeer.ViewModel.Failure) {
        debugPrint(viewModel.error)
    }
}
