//
//  ViewController.swift
//  CountryPedia
//
//  Created by Шермат Эшеров on 27/04/2023.
//

import UIKit
import RxSwift

class HomeViewController: UIViewController {
    
    private lazy var countriesTableView: UITableView = {
        let tableV = UITableView()
        
        return tableV
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
    }
    
 
}

extension HomeViewController{
    private func initTableView(){
        
    }
}

extension HomeViewController{
    private func setupConstraints(){
        view.backgroundColor = .orange
    }
}

