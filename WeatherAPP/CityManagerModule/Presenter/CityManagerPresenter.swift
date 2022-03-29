//
//  CityManagerPresenter.swift
//  WeatherAPP
//
//  Created by Денис Медведев on 23.03.2022.
//

import Foundation
import CoreData

protocol CityManagerViewProtocol: AnyObject {
    
}

protocol CityManagerPresenterProtocol: AnyObject {
    init(view: CityManagerViewProtocol, router: RouterProtocol, context: NSManagedObjectContext)
    
    func selectCity(city number: Int)
}

class CityManagerPresenter: CityManagerPresenterProtocol {
    
    private weak var view: CityManagerViewProtocol?
    private var router: RouterProtocol?
    private var context: NSManagedObjectContext!
    
    required init(view: CityManagerViewProtocol, router: RouterProtocol, context: NSManagedObjectContext) {
        self.view = view
        self.router = router
        self.context = context
    }
    
    func selectCity(city number: Int) {
        router?.backToMainWeather(with: number)
    }
    
}
