//
//  Router.swift
//  WeatherAPP
//
//  Created by Денис Медведев on 25.03.2022.
//

import UIKit

//базовый тип для всех роутеров
protocol RouterMain {
    var containerController: UIViewController? { get set }
    var moduleBuilder: ModuleBuilder? { get set }
}

//для конкретного роутера
protocol RouterProtocol: RouterMain {
    func initialViewController()
    func showCityManager()
    func backToMainWeather(with city: Int)
}

final class Router : RouterProtocol {
    
    var containerController: UIViewController?
    var moduleBuilder: ModuleBuilder?
    
    //MARK: inits
    
    init(container: UIViewController?, moduleBuilder: ModuleBuilder?) {
        self.containerController = container
        self.moduleBuilder = moduleBuilder
    }
    
    func initialViewController() {
        if let containerController = containerController {
            guard let mainWeatherViewController = moduleBuilder?.createMainWeatherModule(router: self) else { return }
            containerController.add(mainWeatherViewController)
        }
    }
    
    func showCityManager() {
        if let containerController = containerController {
            guard let cityManagerViewController = moduleBuilder?.createCityManagerModule(router: self) else { return }
            containerController.add(cityManagerViewController)
            print("cтек добавили \(containerController.children)")
        }
    }
    
    func backToMainWeather(with city: Int) {
        if let containerController = containerController {
            containerController.children.last?.remove()
            print("cтек удалили \(containerController.children)")
        }
    }
    
}
