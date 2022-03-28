//
//  NetworkMonitor.swift
//  WeatherAPP
//
//  Created by Денис Медведев on 18.03.2022.
//

import Foundation
import Network

final class NetworkMonitor {
    
    //MARK: properties
    
    static let shared = NetworkMonitor()
    public  var isConnected: Bool = false
    
    //MARK: private properties
    
    private let queue = DispatchQueue.global()
    private let monitor: NWPathMonitor
    
    //MARK: init
    
    private init() {
        monitor = NWPathMonitor()
    }
    
    //MARK: methods
    
    public func startMonitoring() {
        monitor.start(queue: queue)
        monitor.pathUpdateHandler = {  path in
            self.isConnected = path.status != .unsatisfied
            print(self.isConnected)
        }
    }
    
    public func stopMonitoring() {
        monitor.cancel()
    }
}
