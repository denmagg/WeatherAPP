//
//  CityView.swift
//  WeatherAPP
//
//  Created by Денис Медведев on 22.03.2022.
//

import UIKit

class CityView: UIView {
    
    let cityLabel = UILabel()
    let weatherLabel = UILabel()
    let currentTemperatureLabel = UILabel()
    let todayDateLabel = UILabel()
    let todayLabel = UILabel()
    let todayMaxTemperatureLabel = UILabel()
    let todayMinTemperatureLabel = UILabel()
    
    var collectionViewDataSource: UICollectionViewDataSource?
    var collectionViewDelegate: UICollectionViewDelegate?
    var collectionView: UICollectionView?
    
    var weatherTableViewDataSource: WeatherTableViewDataSource?
    var weatherTableViewDelegate: WeatherTableViewDelegate?
    let tableView = UITableView()
    
    enum Consts {
        enum CityLabel {
            static let text = "Moscow"
            static let font: UIFont = .systemFont(ofSize: 32)
        }
        enum WeatherLabel {
            static let text = "Mostly Clear"
            static let font: UIFont = .systemFont(ofSize: 17)
        }
        enum CurrentTemperatureLabel {
            static let text = "5°"
            static let font: UIFont = .systemFont(ofSize: 50)
        }
        enum TodayDateLabel {
            static let text = "Friday"
            static let font: UIFont = .systemFont(ofSize: 20)
        }
        enum TodayLabel {
            static let text = "TODAY"
            static let font: UIFont = .boldSystemFont(ofSize: 16)
        }
        enum TodayMinTemperatureLabel {
            static let text = "-8"
            static let font: UIFont = .systemFont(ofSize: 20)
        }
        enum TodayMaxTemperatureLabel {
            static let text = "7"
            static let font: UIFont = .systemFont(ofSize: 20)
        }
        enum CollectionView {
            static let height: CGFloat = 100
            static let cellId = "hourlyWeatherCell"
        }
        enum TableView {
            static let dayForecastCellId = "dayForecastCell"
            static let detailDescriptionCellId = "detailDescriptionCell"
            static let specsCellId = "specsCell"
        }
    }
    
    init(frame: CGRect, color: UIColor) {
        super.init(frame: frame)
        self.backgroundColor = color
        
        configureView()
        configureMainWeatherInfo()
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        
    }
    
    private func configureMainWeatherInfo() {
        cityLabel.text = Consts.CityLabel.text
        cityLabel.font = Consts.CityLabel.font
        
        weatherLabel.text = Consts.WeatherLabel.text
        weatherLabel.font = Consts.WeatherLabel.font
        
        currentTemperatureLabel.text = Consts.CurrentTemperatureLabel.text
        currentTemperatureLabel.font = Consts.CurrentTemperatureLabel.font
        
        todayDateLabel.text = Consts.TodayDateLabel.text
        todayDateLabel.font = Consts.TodayDateLabel.font
        
        todayLabel.text = Consts.TodayLabel.text
        todayLabel.font = Consts.TodayLabel.font
        
        todayMinTemperatureLabel.text = Consts.TodayMinTemperatureLabel.text
        todayMinTemperatureLabel.font = Consts.TodayMinTemperatureLabel.font
        
        todayMaxTemperatureLabel.text = Consts.TodayMaxTemperatureLabel.text
        todayMaxTemperatureLabel.font = Consts.TodayMaxTemperatureLabel.font
        
        let layout = CollectionViewFlowLayout()
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: Consts.CollectionView.height), collectionViewLayout: layout)
        collectionView?.backgroundColor = .red
        let dataHourlyForecast = [("Now","☀️","8°"), ("20","☀️","8°"), ("21","☀️","8°"), ("22","☀️","8°"), ("23","☀️","8°"), ("00","☀️","8°"), ("01","☀️","8°"), ("02","☀️","8°"), ("03","☀️","8°"), ("04","☀️","8°"), ("05","☀️","8°"), ("06","☀️","8°"), ("06:28","☀️","Sunrise°"), ("07","☀️","8°"), ("08","☀️","8°"), ("09","☀️","8°"), ("10","☀️","8°"), ("11","☀️","8°"), ("12","☀️","8°"), ("13","☀️","8°"), ("14","☀️","8°"), ("15","☀️","8°"), ("16","☀️","8°"), ("17","☀️","8°"), ("18","☀️","8°"), ("18:48","☀️","Sunset°"), ("19","☀️","8°")]
        let hourlyWeatherData = HourlyWeatherData(dataHourlyForecast: dataHourlyForecast)
        self.collectionViewDelegate = CollectionViewDelegate(withDelegate: self)
        self.collectionViewDataSource = CollectionViewDataSource(withData: hourlyWeatherData)
        collectionView?.delegate = self.collectionViewDelegate
        collectionView?.dataSource = self.collectionViewDataSource
        collectionView?.register(HourlyWeatherCell.self, forCellWithReuseIdentifier: Consts.CollectionView.cellId)
        collectionView?.showsHorizontalScrollIndicator = false
//        collectionView.setCollectionViewLayout(UICollectionViewLayout, animated: true)
                
        //FIXME временная data
        
        let dataDayForecast = [("Saturday", "☀️", "8", "-1"), ("Sunday", "☀️", "8", "-1"), ("Monday", "☀️", "8", "-1"), ("Tuesday", "☀️", "8", "-1"), ("Wednesday", "☀️", "8", "-1"), ("Thursday", "☀️", "8", "-1"), ("Friday", "☀️", "8", "-1"), ("Saturday", "☀️", "8", "-1"), ("Sunday", "☀️", "8", "-1")]
        let dataDetailDescription = "Today: Mostly clear currently. It's 5°; the high today was forecast as 9°"
        let dataSpecs = [("SUNRISE", "6:29"), ("SUNSET", "18:45"), ("CHANCE OF RAIN", "10%"), ("HUMIDITY", "55%"), ("WIND", "NW 3 m/s"), ("FEELS LIKE", "3°"), ("PRECIPITATION", "0 cm"), ("PRESSURE", "775,71 mm Hg"), ("VISIBILITY", "9,7 km"), ("UV INDEX", "0")]
        let weatherData = WeatherData(dataDayForecast: dataDayForecast, dataDetailDescription: dataDetailDescription, dataSpecs: dataSpecs)
        
        self.weatherTableViewDelegate = WeatherTableViewDelegate(withDelegate: self)

        self.weatherTableViewDataSource = WeatherTableViewDataSource(withData: weatherData)
        tableView.delegate = self.weatherTableViewDelegate
        tableView.dataSource = self.weatherTableViewDataSource
        tableView.backgroundColor = .green
        tableView.separatorStyle = .none
        tableView.register(DayForecastTableViewCell.self, forCellReuseIdentifier: Consts.TableView.dayForecastCellId)
        tableView.register(DetailDescriptionTableViewCell.self, forCellReuseIdentifier: Consts.TableView.detailDescriptionCellId)
        tableView.register(SpecsTableViewCell.self, forCellReuseIdentifier: Consts.TableView.specsCellId)
    }
    
    private func setupSubviews() {
        self.addSubview(cityLabel)
        self.addSubview(weatherLabel)
        self.addSubview(currentTemperatureLabel)
        
        self.addSubview(todayDateLabel)
        self.addSubview(todayLabel)
        self.addSubview(todayMinTemperatureLabel)
        self.addSubview(todayMaxTemperatureLabel)
        
        self.addSubview(collectionView!)
        self.addSubview(tableView)
    }
    
    private func setupConstraints() {
        // setup cityLabel constraints
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        cityLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor).isActive = true
        //cityLabel.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        cityLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        
        // setup weatherLabel constraints
        weatherLabel.translatesAutoresizingMaskIntoConstraints = false
        weatherLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor).isActive = true
        weatherLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor).isActive = true
        
        // setup currentTemperatureLabel constraints
        currentTemperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        currentTemperatureLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor).isActive = true
        currentTemperatureLabel.topAnchor.constraint(equalTo: weatherLabel.bottomAnchor).isActive = true

        // setup todayDateLabel constraints
        todayDateLabel.translatesAutoresizingMaskIntoConstraints = false
        todayDateLabel.topAnchor.constraint(equalTo: currentTemperatureLabel.bottomAnchor, constant: 10).isActive = true
        todayDateLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        todayDateLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 30).isActive = true
        
        // setup todayLabel constraints
        todayLabel.translatesAutoresizingMaskIntoConstraints = false
        todayLabel.firstBaselineAnchor.constraint(equalTo: todayDateLabel.firstBaselineAnchor).isActive = true
        //todayLabel.topAnchor.constraint(equalTo: currentTemperatureLabel.bottomAnchor, constant: 10).isActive = true
        todayLabel.leadingAnchor.constraint(equalTo: todayDateLabel.trailingAnchor, constant: 10).isActive = true
        
        // setup todayMinTemperatureLabel constraints
        todayMinTemperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        todayMinTemperatureLabel.topAnchor.constraint(equalTo: currentTemperatureLabel.bottomAnchor, constant: 10).isActive = true
        todayMinTemperatureLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        
        // setup todayMaxTemperatureLabel constraints
        todayMaxTemperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        todayMaxTemperatureLabel.topAnchor.constraint(equalTo: currentTemperatureLabel.bottomAnchor, constant: 10).isActive = true
        todayMaxTemperatureLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -60).isActive = true
        
        // setup collectionView constraints
        collectionView?.translatesAutoresizingMaskIntoConstraints = false
        collectionView?.topAnchor.constraint(equalTo: todayDateLabel.bottomAnchor, constant: 5).isActive = true
        collectionView?.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor).isActive = true
        collectionView?.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor).isActive = true
        collectionView?.bottomAnchor.constraint(equalTo: tableView.topAnchor).isActive = true
        
        // setup tableView constraints
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: todayDateLabel.bottomAnchor, constant: 100).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -34).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }

}

extension CityView: MainWeatherVCDelegate {
    func selectedCell(row: Int) {
        print("Row: \(row)")
    }
}

extension CityView: WeatherCollectionViewDelegate {
    func selectedItem(number: Int) {
        print("selected item number: \(number)")
    }
}
