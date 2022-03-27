//
//  MainWeatherPresenter.swift
//  WeatherAPP
//
//  Created by Денис Медведев on 18.03.2022.
//

import Foundation

protocol MainWeatherViewProtocol: AnyObject {
    func success()
    func failure()
}

protocol MainWeatherPresenterProtocol: AnyObject {
    init(view: MainWeatherViewProtocol, router: RouterProtocol)
    
    func tapOnTheManage()
}

class MainWeatherPresenter: MainWeatherPresenterProtocol {
    
    //MARK: private properties
    
    private weak var view: MainWeatherViewProtocol?
    private var router: RouterProtocol?
    
    required init(view: MainWeatherViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }
    
    func tapOnTheManage() {
        router?.showCityManager()
    }

}
