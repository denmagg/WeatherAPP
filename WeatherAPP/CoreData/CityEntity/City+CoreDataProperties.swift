//
//  City+CoreDataProperties.swift
//  WeatherAPP
//
//  Created by Денис Медведев on 30.03.2022.
//
//

import Foundation
import CoreData


extension City {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<City> {
        return NSFetchRequest<City>(entityName: "City")
    }

    @NSManaged public var name: String?
    @NSManaged public var temperature: Int16
    @NSManaged public var isCelsius: Bool
    @NSManaged public var timezoneUTC: Int16
    @NSManaged public var isCurrent: Bool
    @NSManaged public var weatherForecast: WeatherForecast?

}

extension City : Identifiable {

}
