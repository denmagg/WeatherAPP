//
//  CityManagerPresenter.swift
//  WeatherAPP
//
//  Created by Денис Медведев on 23.03.2022.
//

import Foundation

protocol CityManagerViewProtocol: AnyObject {
    
}

protocol CityManagerPresenterProtocol: AnyObject {
    init(view: CityManagerViewProtocol, router: RouterProtocol)
    
    func selectCity(city number: Int)
}

class CityManagerPresenter: CityManagerPresenterProtocol {
    
    private weak var view: CityManagerViewProtocol?
    private var router: RouterProtocol?
    
    required init(view: CityManagerViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }
    
    func selectCity(city number: Int) {
        router?.backToMainWeather(with: number)
    }
    
}
