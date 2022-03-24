//
//  WeatherTableViewDataSource.swift
//  WeatherAPP
//
//  Created by Денис Медведев on 19.03.2022.
//

import UIKit

class WeatherTableViewDataSource: NSObject, UITableViewDataSource {
    
    var dataDayForecast: [(String?, String?, String?, String?)]?
    var dataDetailDescription: String?
    var dataSpecs: [(String?, String?)]?
    
    var dayForecastCount = 0
    var detailDescriptionCount = 0
    var specsCount = 0
    
    init(withData weatherData: WeatherData) {
        super.init()
        
        self.dataDayForecast = weatherData.dataDayForecast
        self.dataDetailDescription = weatherData.dataDetailDescription
        self.dataSpecs = weatherData.dataSpecs
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = 0
        if let dayForecastCount = self.dataDayForecast?.count {
            self.dayForecastCount = dayForecastCount
            count += dayForecastCount
        }
        if dataDetailDescription != nil {
            self.detailDescriptionCount = 1
            count += detailDescriptionCount
        }
        if let specsCount = dataSpecs?.count {
            self.specsCount = specsCount
            count += specsCount
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0...(dayForecastCount-1):
            let cell = tableView.dequeueReusableCell(withIdentifier: "dayForecastCell", for: indexPath) as! DayForecastTableViewCell
            cell.dayLabel.text = dataDayForecast?[indexPath.row].0 ?? "-"
            cell.weatherEmojiLabel.text = dataDayForecast?[indexPath.row].1 ?? "-"
            cell.maxTemperatureLabel.text = dataDayForecast?[indexPath.row].2 ?? "-"
            cell.minTemperatureLabel.text = dataDayForecast?[indexPath.row].3 ?? "-"
            return cell
        case dayForecastCount...(dayForecastCount + detailDescriptionCount - 1):
            let cell = tableView.dequeueReusableCell(withIdentifier: "detailDescriptionCell", for: indexPath) as! DetailDescriptionTableViewCell
            cell.textLabel?.text = dataDetailDescription
            return cell
        case (dayForecastCount + detailDescriptionCount)...(dayForecastCount + detailDescriptionCount + specsCount - 1):
            let cell = tableView.dequeueReusableCell(withIdentifier: "specsCell", for: indexPath) as! SpecsTableViewCell
            //FIXME: textLabel depricated soon
            cell.textLabel?.text = dataSpecs?[indexPath.row - (dayForecastCount + detailDescriptionCount)].0
            cell.detailTextLabel?.text = dataSpecs?[indexPath.row - (dayForecastCount + detailDescriptionCount)].1
            return cell
        default:
            return UITableViewCell()
        }
    }
}
