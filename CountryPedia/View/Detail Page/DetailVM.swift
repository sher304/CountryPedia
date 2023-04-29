//
//  DetailVM.swift
//  CountryPedia
//
//  Created by Шермат Эшеров on 29/04/2023.
//

import Foundation
import RxSwift


class DetailVM{
    let disposeBag = DisposeBag()
    
    let code = BehaviorSubject<String>(value: "")
    
    var codeSubscriber: Observable<String> {
        return code.asObservable()
    }
    
    private let country = BehaviorSubject<SingleCountry>(value: [])
    var countrySubscriber: Observable<SingleCountry> {
        return country.asObservable()
    }
    
    func viewDidLoad(){
        codeSubscriber.subscribe { code in
            print("viewDidLoad", code)
            ApiAuth().getSingleCountry(code: code) { countryData in
                switch countryData{
                case.success(let country):
                    print(countryData)
                    self.country.onNext(country)
                    break
                case.failure(_):
                    break
                }
            }
        }.disposed(by: disposeBag)
    }
}
