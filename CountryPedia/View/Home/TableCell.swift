//
//  TableCell.swift
//  CountryPedia
//
//  Created by Шермат Эшеров on 27/04/2023.
//

import UIKit
import Kingfisher
import SnapKit

class CountryCell: UITableViewCell{
    
    public static var cellId: String{
        return "CountryCell"
    }
    
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
        contentView.addSubview(countryFlag)
        countryFlag.snp.makeConstraints { make in
            make.leading.equalTo(20)
            make.centerY.equalToSuperview()
            make.height.width.equalTo(contentView.frame.height / 2)
        }
        
        contentView.addSubview(countryName)
        countryName.snp.makeConstraints { make in
            make.leading.equalTo(countryFlag.snp.trailing).offset(40)
            make.centerY.equalToSuperview()
        }
    }
    
    public func fetchData(title: String, image: String){
        DispatchQueue.main.async {
            self.countryName.text = title
            self.countryFlag.kf.setImage(with: URL(string: image))
        }
    }
}
