//
//  UrlFactoty.swift
//  CountryPedia
//
//  Created by Шермат Эшеров on 29/04/2023.
//

import Foundation


struct UrlFactory {
    
    private let baseUrl: URL
    let getAllCountries: URL
    
    init(baseUrl: URL = URL(string: "https://restcountries.com/v3.1/")!) {
        self.baseUrl = baseUrl
        self.getAllCountries = URL(string: baseUrl.appendingPathComponent("all").description)!
    }
    
}
