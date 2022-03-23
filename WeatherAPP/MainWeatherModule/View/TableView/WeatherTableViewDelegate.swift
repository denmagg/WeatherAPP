//
//  WeatherTableViewDelegate.swift
//  WeatherAPP
//
//  Created by Денис Медведев on 19.03.2022.
//

import UIKit

protocol MainWeatherVCDelegate: AnyObject {
    func selectedCell(row: Int)
}

class WeatherTableViewDelegate: NSObject, UITableViewDelegate {
    // #1
    weak var delegate: MainWeatherVCDelegate?
    
    // #2
    init(withDelegate delegate: MainWeatherVCDelegate) {
        self.delegate = delegate
    }
    
    // #3
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.selectedCell(row: indexPath.row)
    }
}
