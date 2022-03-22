//
//  TableViewDelegate.swift
//  WeatherAPP
//
//  Created by Денис Медведев on 19.03.2022.
//

import UIKit

protocol WeatherTableViewDelegate: AnyObject {
    func selectedCell(row: Int)
}

class TableViewDelegate: NSObject, UITableViewDelegate {
    // #1
    weak var delegate: WeatherTableViewDelegate?
    
    // #2
    init(withDelegate delegate: WeatherTableViewDelegate) {
        self.delegate = delegate
    }
    
    // #3
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.selectedCell(row: indexPath.row)
    }
}
