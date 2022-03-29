//
//  MainWeatherPresenter.swift
//  WeatherAPP
//
//  Created by Денис Медведев on 18.03.2022.
//

import Foundation
import CoreData

protocol MainWeatherViewProtocol: AnyObject {
    func success()
    func failure()
}

protocol MainWeatherPresenterProtocol: AnyObject {
    init(view: MainWeatherViewProtocol, router: RouterProtocol, locationFetcher: LocationFetcher)
    
    func tapOnTheManage()
}

class MainWeatherPresenter: MainWeatherPresenterProtocol {
    
    //MARK: private properties
    
    private weak var view: MainWeatherViewProtocol?
    private var router: RouterProtocol?
    private let locationFetcher: LocationFetcher?
    
    
    required init(view: MainWeatherViewProtocol, router: RouterProtocol, locationFetcher: LocationFetcher) {
        self.view = view
        self.router = router
        self.locationFetcher = locationFetcher
        locationFetcher.start()
    }
    
    func tapOnTheManage() {
        router?.showCityManager()
    }

}
