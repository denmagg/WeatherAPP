//
//  DailyForecast+CoreDataProperties.swift
//  WeatherAPP
//
//  Created by Денис Медведев on 30.03.2022.
//
//

import Foundation
import CoreData


extension DailyForecast {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DailyForecast> {
        return NSFetchRequest<DailyForecast>(entityName: "DailyForecast")
    }

    @NSManaged public var maxTemperature: Int16
    @NSManaged public var minTemperature: Int16
    @NSManaged public var weatherIcon: Data?
    @NSManaged public var weatherForecast: WeatherForecast?

}

extension DailyForecast : Identifiable {

}
