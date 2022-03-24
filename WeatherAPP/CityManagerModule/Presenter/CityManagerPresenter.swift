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
    init(view: CityManagerViewProtocol)
    
    
}

class CityManagerPresenter: CityManagerPresenterProtocol {
    
    private weak var view: CityManagerViewProtocol?
    
    required init(view: CityManagerViewProtocol) {
        self.view = view
    }
    
    
}
