//
//  Router.swift
//  WeatherAPP
//
//  Created by Денис Медведев on 18.03.2022.
//

import UIKit

//базовый тип для всех роутеров
protocol RouterMain {
    var viewController: UIViewController? { get set }
    var moduleBuilder: ModuleBuilderProtocol? { get set }
}

//для конкретного роутера
protocol RouterProtocol: RouterMain {
    func initialViewController()
}

final class Router : RouterProtocol {

    var viewController: UIViewController?

    var moduleBuilder: ModuleBuilderProtocol?
    
    //MARK: inits
    
    init(viewController: UIViewController?, moduleBuilder: ModuleBuilderProtocol?){
        self.viewController = viewController
        self.moduleBuilder = moduleBuilder
    }

    func initialViewController() {
        if let viewController = viewController {
            guard let mainWeatherViewController = moduleBuilder?.createMainWeatherModule(router: self) else { return }
        }
    }


}
