//
//  CitiesTableViewDataSource.swift
//  WeatherAPP
//
//  Created by Денис Медведев on 23.03.2022.
//

import UIKit

class CitiesTableViewDataSource: NSObject, UITableViewDataSource {
    
    var cityDataArray: [(name: String, time: String, temperature: String)]?
    var cityCount = 0
    
    init(withData cityDataArray: [(name: String, time: String, temperature: String)]) {
        super.init()
        
        self.cityDataArray = cityDataArray
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let cityCount = cityDataArray?.count else { return 2 }
        self.cityCount = cityCount
        return cityCount + 2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath) as! CityTableViewCell
            cell.nameLabel.text = cityDataArray?[indexPath.row].name
            cell.timeLabel.text = cityDataArray?[indexPath.row].time
            cell.isCurrentImageView.isHidden = false
            return cell
        case 1..<cityCount:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath) as! CityTableViewCell
            cell.nameLabel.text = cityDataArray?[indexPath.row].name
            cell.timeLabel.text = cityDataArray?[indexPath.row].time
            cell.isCurrentImageView.isHidden = true
            return cell
        case cityCount..<(cityCount+2):
            let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath) as! ManageTableViewCell
            return cell
        default:
            print("Error")
            return UITableViewCell()
        }
    }




}
