//
//  ApiAuth.swift
//  CountryPedia
//
//  Created by Шермат Эшеров on 29/04/2023.
//

import Foundation

class ApiAuth {
    
    private let urlFactory = UrlFactory()
    
    func getAllCountries(completion: @escaping(Result<Countries, Error>) -> Void){
        let url = URLRequest(url: urlFactory.getAllCountries)
        Network.baseUrl(url: url, method: "get", completion: completion)
    }
    
    func getSingleCountry(code: String, completion: @escaping(Result<SingleCountry, Error>) -> Void){
        let url = URLRequest(url: URL(string: "\(urlFactory.getCountry)\(code)")!)
        Network.baseUrl(url: url, method: "get", completion: completion)
    }
    
}
