//
//  ModuleBuilder.swift
//  WeatherAPP
//
//  Created by Денис Медведев on 18.03.2022.
//

import UIKit

protocol ModuleBuilderProtocol {
    func createMainWeatherModule(router: RouterProtocol) -> UIViewController
    func createCityManagerModule(router: RouterProtocol) -> UIViewController
}

//Внедрение зависимостей - те они создаются не внутри всех этих сущностей эти штуки, а снаружи и потом туда инжектятся
//Нужна по SOLID, и для того чтобы во время тестов подсунуть сюда мок объект, для того чтобы протестировать презентер.
final class ModuleBuilder: ModuleBuilderProtocol {
    
    //MARK: methods
    
    func createMainWeatherModule(router: RouterProtocol) -> UIViewController {
        let view = MainWeatherViewController()
        let locationFetcher = LocationFetcher()
        let context = (UIApplication.shared.delegate as? AppDelegate)?.coreDataStack.persistentContainer.viewContext
        let presenter = MainWeatherPresenter(view: view, router: router, locationFetcher: locationFetcher, context: context!)
        view.presenter = presenter
        return view
    }
    
    func createCityManagerModule(router: RouterProtocol) -> UIViewController {
        let view = CityManagerViewController()
        let context = (UIApplication.shared.delegate as? AppDelegate)?.coreDataStack.persistentContainer.viewContext
        let presenter = CityManagerPresenter(view: view, router: router, context: context!)
        view.presenter = presenter
        return view
    }
}
