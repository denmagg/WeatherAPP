//
//  WeatherForecast+CoreDataProperties.swift
//  WeatherAPP
//
//  Created by Денис Медведев on 30.03.2022.
//
//

import Foundation
import CoreData


extension WeatherForecast {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WeatherForecast> {
        return NSFetchRequest<WeatherForecast>(entityName: "WeatherForecast")
    }

    @NSManaged public var weatherDescription: String?
    @NSManaged public var weatherDetailDescription: String?
    @NSManaged public var sunrise: Date?
    @NSManaged public var sunset: Date?
    @NSManaged public var chanceOfPrecipitation: Int16
    @NSManaged public var typeOfPrecipitation: String?
    @NSManaged public var humidity: Int16
    @NSManaged public var windSpeed: Int16
    @NSManaged public var windDirection: Int16
    @NSManaged public var feelsLike: Int16
    @NSManaged public var precipitationSize: Float
    @NSManaged public var pressure: Float
    @NSManaged public var visibility: Float
    @NSManaged public var uvIndex: Int16
    @NSManaged public var city: City?
    @NSManaged public var dailyForecast: NSOrderedSet?
    @NSManaged public var hourlyForecast: NSOrderedSet?

}

// MARK: Generated accessors for dailyForecast
extension WeatherForecast {

    @objc(insertObject:inDailyForecastAtIndex:)
    @NSManaged public func insertIntoDailyForecast(_ value: DailyForecast, at idx: Int)

    @objc(removeObjectFromDailyForecastAtIndex:)
    @NSManaged public func removeFromDailyForecast(at idx: Int)

    @objc(insertDailyForecast:atIndexes:)
    @NSManaged public func insertIntoDailyForecast(_ values: [DailyForecast], at indexes: NSIndexSet)

    @objc(removeDailyForecastAtIndexes:)
    @NSManaged public func removeFromDailyForecast(at indexes: NSIndexSet)

    @objc(replaceObjectInDailyForecastAtIndex:withObject:)
    @NSManaged public func replaceDailyForecast(at idx: Int, with value: DailyForecast)

    @objc(replaceDailyForecastAtIndexes:withDailyForecast:)
    @NSManaged public func replaceDailyForecast(at indexes: NSIndexSet, with values: [DailyForecast])

    @objc(addDailyForecastObject:)
    @NSManaged public func addToDailyForecast(_ value: DailyForecast)

    @objc(removeDailyForecastObject:)
    @NSManaged public func removeFromDailyForecast(_ value: DailyForecast)

    @objc(addDailyForecast:)
    @NSManaged public func addToDailyForecast(_ values: NSOrderedSet)

    @objc(removeDailyForecast:)
    @NSManaged public func removeFromDailyForecast(_ values: NSOrderedSet)

}

// MARK: Generated accessors for hourlyForecast
extension WeatherForecast {

    @objc(insertObject:inHourlyForecastAtIndex:)
    @NSManaged public func insertIntoHourlyForecast(_ value: HourlyForecast, at idx: Int)

    @objc(removeObjectFromHourlyForecastAtIndex:)
    @NSManaged public func removeFromHourlyForecast(at idx: Int)

    @objc(insertHourlyForecast:atIndexes:)
    @NSManaged public func insertIntoHourlyForecast(_ values: [HourlyForecast], at indexes: NSIndexSet)

    @objc(removeHourlyForecastAtIndexes:)
    @NSManaged public func removeFromHourlyForecast(at indexes: NSIndexSet)

    @objc(replaceObjectInHourlyForecastAtIndex:withObject:)
    @NSManaged public func replaceHourlyForecast(at idx: Int, with value: HourlyForecast)

    @objc(replaceHourlyForecastAtIndexes:withHourlyForecast:)
    @NSManaged public func replaceHourlyForecast(at indexes: NSIndexSet, with values: [HourlyForecast])

    @objc(addHourlyForecastObject:)
    @NSManaged public func addToHourlyForecast(_ value: HourlyForecast)

    @objc(removeHourlyForecastObject:)
    @NSManaged public func removeFromHourlyForecast(_ value: HourlyForecast)

    @objc(addHourlyForecast:)
    @NSManaged public func addToHourlyForecast(_ values: NSOrderedSet)

    @objc(removeHourlyForecast:)
    @NSManaged public func removeFromHourlyForecast(_ values: NSOrderedSet)

}

extension WeatherForecast : Identifiable {

}
