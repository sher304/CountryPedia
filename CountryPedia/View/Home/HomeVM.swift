//
//  HomeVM.swift
//  CountryPedia
//
//  Created by Шермат Эшеров on 27/04/2023.
//

import Foundation
import RxSwift

class HomeViewModel {
    
    private let countriesSubject = BehaviorSubject<Countries>(value: [])
    
    var countriesSubscriber: Observable<Countries> {
        return countriesSubject.asObservable()
    }
    
    private lazy var detailViewModel = {
        return DetailVM()
    }()
    
    public func viewDiDLoad(){
        ApiAuth().getAllCountries { [self] countriesData in
            switch countriesData{
            case.success(let countries):
                countriesSubject.onNext(countries)
                break
            case.failure(_):
                break
            }
        }
    }
    
    public func selectedCountry(code: String){
        detailViewModel.code.onNext(code)
        detailViewModel.code.subscribe(onNext: { data in
            print(data, "viewmodel")
        })
    }
}
