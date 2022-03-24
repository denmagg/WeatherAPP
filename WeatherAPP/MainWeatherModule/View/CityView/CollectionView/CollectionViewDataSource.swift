//
//  CollectionViewDataSource.swift
//  WeatherAPP
//
//  Created by Денис Медведев on 19.03.2022.
//

import Foundation
import UIKit

class CollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    var hourlyWeatherData: [(String?, String?, String?)]?
    
    init(withData hourlyWeatherData: HourlyWeatherData) {
        super.init()
        
        self.hourlyWeatherData = hourlyWeatherData.dataHourlyForecast
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "hourlyWeatherCell", for: indexPath) as! HourlyWeatherCell
        cell.backgroundColor = .purple
        cell.timeLabel.text = hourlyWeatherData?[indexPath.row].0
        cell.weatherEmojiLabel.text = hourlyWeatherData?[indexPath.row].1
        cell.temperatureLabel.text = hourlyWeatherData?[indexPath.row].2
        return cell
    }
    
}
