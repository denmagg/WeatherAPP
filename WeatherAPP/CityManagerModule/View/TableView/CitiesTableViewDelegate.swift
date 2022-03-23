//
//  CitiesTableViewDelegate.swift
//  WeatherAPP
//
//  Created by Денис Медведев on 23.03.2022.
//

import UIKit

protocol CityManagerVCDelegate: AnyObject {
    func selectedCell(row: Int)
}

class CitiesTableViewDelegate: NSObject, UITableViewDelegate {
    // #1
    weak var delegate: CityManagerVCDelegate?
    
    // #2
    init(withDelegate delegate: CityManagerVCDelegate) {
        self.delegate = delegate
    }
    
    // #3
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.selectedCell(row: indexPath.row)
    }
}
