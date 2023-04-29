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
    
    static let sahred = DetailVM()
    
    private let country = BehaviorSubject<SingleCountry>(value: [])
    var countrySubscriber: Observable<SingleCountry> {
        return country.asObservable()
    }
    
    let codeSubject = BehaviorSubject<String>(value: "")
    var codeSubscriber: Observable<String> {
        return codeSubject.asObservable()
    }
    
    func viewDidLoad(){
        codeSubscriber.subscribe { code in
            ApiAuth().getSingleCountry(code: code) { countryData in
                switch countryData{
                case.success(let country):
                    print(country, "viwedidload")
                    self.country.onNext(country)
                    break
                case.failure(_):
                    break
                }
            }
        }.disposed(by: disposeBag)
    }
}
