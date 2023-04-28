//
//  Network.swift
//  CountryPedia
//
//  Created by Шермат Эшеров on 29/04/2023.
//

import Foundation
import Alamofire

class Network{
    
    static func baseUrl<T: Codable>(url: URLRequest, method: String, completion: @escaping(Result<T, Error>) -> Void){
        guard url.url != nil else { return }
        
        var request = URLRequest(url: url.url!)
        request.httpMethod = method.uppercased()
        
        AF.request(request).response { responce in
            DispatchQueue.main.async {
                guard let data = responce.data,
                      let jsonObj = try? JSONDecoder().decode(T.self, from: data)
                else { return }
                completion(.success(jsonObj))
            }
        }
    }
}
