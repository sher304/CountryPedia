//
//  ViewController.swift
//  CountryPedia
//
//  Created by Шермат Эшеров on 27/04/2023.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit

class HomeViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    private lazy var viewModel = {
        return HomeViewModel()
    }()
    
    private lazy var countriesTableView: UITableView = {
        let tableV = UITableView()
        tableV.register(CountryCell.self, forCellReuseIdentifier: CountryCell.cellId)
        //        tableV.delegate = self
        //        tableV.dataSource = self
        return tableV
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        initTableView()
        bind()
    }
    
    
}

extension HomeViewController{
    private func bind(){
        viewModel.viewDiDLoad()
        viewModel.countriesSubscriber.subscribe { data in
            
            self.countriesTableView.reloadData()
        }.disposed(by: disposeBag)
    }
    
    private func initTableView(){
        self.countriesTableView.rx.setDelegate(self).disposed(by: disposeBag)
        
        
        self.viewModel.countriesSubscriber
            .bind(to: countriesTableView.rx.items(cellIdentifier: CountryCell.cellId, cellType: CountryCell.self)) { index, model, cell in
                cell.fetchData(title: model.name.official.description)
            }.disposed(by: disposeBag)
    }
}

extension HomeViewController{
    private func setupConstraints(){
        view.backgroundColor = .orange
        
        view.addSubview(countriesTableView)
        countriesTableView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).offset(40)
        }
    }
}

extension HomeViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = 0
        viewModel.countriesSubscriber.subscribe { data in
            count = data.element?.count ?? 0
        }.disposed(by: disposeBag)
        return count
    }
}
