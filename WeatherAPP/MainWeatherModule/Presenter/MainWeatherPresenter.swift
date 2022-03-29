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
    init(view: MainWeatherViewProtocol, router: RouterProtocol, locationFetcher: LocationFetcher, context: NSManagedObjectContext)
    
    func tapOnTheManage()
}

class MainWeatherPresenter: MainWeatherPresenterProtocol {
    
    //MARK: private properties
    
    private weak var view: MainWeatherViewProtocol?
    private var router: RouterProtocol?
    private let locationFetcher: LocationFetcher?
    private var context: NSManagedObjectContext!
    
    required init(view: MainWeatherViewProtocol, router: RouterProtocol, locationFetcher: LocationFetcher, context: NSManagedObjectContext) {
        self.view = view
        self.router = router
        self.locationFetcher = locationFetcher
        self.context = context
        locationFetcher.start()
    }
    
    func tapOnTheManage() {
        router?.showCityManager()
    }

}
