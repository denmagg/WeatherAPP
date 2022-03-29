//
//  HourlyForecast+CoreDataProperties.swift
//  WeatherAPP
//
//  Created by Денис Медведев on 30.03.2022.
//
//

import Foundation
import CoreData


extension HourlyForecast {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<HourlyForecast> {
        return NSFetchRequest<HourlyForecast>(entityName: "HourlyForecast")
    }

    @NSManaged public var time: Date?
    @NSManaged public var weatherIcon: Data?
    @NSManaged public var temperature: String?
    @NSManaged public var weatherForecast: WeatherForecast?

}

extension HourlyForecast : Identifiable {

}
