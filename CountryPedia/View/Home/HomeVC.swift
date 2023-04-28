//
//  ViewController.swift
//  CountryPedia
//
//  Created by Шермат Эшеров on 27/04/2023.
//

import UIKit
import RxSwift

class HomeViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    private lazy var viewModel = {
        return HomeViewModel()
    }()
    
    private lazy var countriesTableView: UITableView = {
        let tableV = UITableView()
        
        return tableV
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        bind()
    }
    
 
}

extension HomeViewController{
    private func bind(){
        viewModel.viewDiDLoad()
        viewModel.countriesSubscriber.subscribe { data in
            
        }.disposed(by: disposeBag)
    }
    
    private func initTableView(){
        
    }
}

extension HomeViewController{
    private func setupConstraints(){
        view.backgroundColor = .orange
    }
}

