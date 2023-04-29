//
//  DetailVC.swift
//  CountryPedia
//
//  Created by Шермат Эшеров on 29/04/2023.
//

import UIKit


class DetailVC: UIViewController{
    
    private lazy var detailViewModel = DetailVM.sahred
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        setupConstraints()
    }
    
    private func setupConstraints(){
        view.backgroundColor = .darkGray
        
    }
}

extension DetailVC{
    func bind(){
        detailViewModel.viewDidLoad()
        detailViewModel.countrySubscriber.subscribe { country in
            print(country.element, "detail vc")
        }
    }
}
