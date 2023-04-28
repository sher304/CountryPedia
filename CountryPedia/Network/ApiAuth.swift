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
    
}
