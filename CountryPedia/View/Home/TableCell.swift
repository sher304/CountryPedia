//
//  TableCell.swift
//  CountryPedia
//
//  Created by Шермат Эшеров on 27/04/2023.
//

import UIKit

class CountryCell: UITableViewCell{
    
    private lazy var countryName: UILabel = {
        let label = UILabel()
        label.text = "Country Name"
        return label
    }()
    
    private lazy var countryFlag: UIImageView = {
        let imageV = UIImageView()
        imageV.backgroundColor = .red
        return imageV
    }()
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupConstraints()
    }
    
    private func setupConstraints(){
        
    }
}

extension CountryCell{
    
    public static var cellId: String{
        return "CountryCell"
    }
    
    public func register(tableView: UITableView){
        tableView.register(CountryCell.self, forCellReuseIdentifier: CountryCell.cellId)
    }
    
}
