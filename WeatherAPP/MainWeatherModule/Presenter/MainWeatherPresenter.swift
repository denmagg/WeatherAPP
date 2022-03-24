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
    init(view: MainWeatherViewProtocol)
    
    func tapOnTheManage()
}

class MainWeatherPresenter: MainWeatherPresenterProtocol {
    //MARK: private properties
    
    private weak var view: MainWeatherViewProtocol?
    
    required init(view: MainWeatherViewProtocol) {
        self.view = view
    }
    
    func tapOnTheManage() {
        
    }
}
