//
//  ModuleBuilder.swift
//  WeatherAPP
//
//  Created by Денис Медведев on 18.03.2022.
//

import UIKit

protocol ModuleBuilderProtocol {
    func createMainWeatherModule() -> UIViewController
    func createCityManagerModule() -> UIViewController
}

//Внедрение зависимостей - те они создаются не внутри всех этих сущностей эти штуки, а снаружи и потом туда инжектятся
//Нужна по SOLID, и для того чтобы во время тестов подсунуть сюда мок объект, для того чтобы протестировать презентер.
final class ModuleBuilder: ModuleBuilderProtocol {
    
    //MARK: methods
    
    func createMainWeatherModule() -> UIViewController {
        let view = MainWeatherViewController()
        let presenter = MainWeatherPresenter(view: view)
        view.presenter = presenter
        return view
    }
    
    func createCityManagerModule() -> UIViewController {
        let view = CityManagerViewController()
        let presenter = CityManagerPresenter(view: view)
        view.presenter = presenter
        return view
    }
}
