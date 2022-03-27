//
//  MainWeatherViewController.swift
//  WeatherAPP
//
//  Created by Денис Медведев on 18.03.2022.
//

import UIKit

struct WeatherData {
    var dataDayForecast: [(String, String, String, String)]
    var dataDetailDescription: String
    var dataSpecs: [(String, String)]
}

struct HourlyWeatherData {
    var dataHourlyForecast: [(String, String, String)]
}

class MainWeatherViewController: UIViewController {
    
    var presenter: MainWeatherPresenterProtocol!
    var bottomPadding: CGFloat?
    let manageButton = UIButton()
    let weatherLinkButton = UIButton()
    var loadingPage = 0
    
    lazy var cityViews = [CityView(frame: CGRect.zero, color: .blue), CityView(frame: CGRect.zero, color: .gray)]
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isPagingEnabled = true
        scrollView.contentSize = CGSize(width: self.view.frame.width * CGFloat(cityViews.count) , height: self.view.frame.height)
        
        for i in 0..<cityViews.count {
            scrollView.addSubview(cityViews[i])
            cityViews[i].frame = CGRect(x: self.view.frame.width * CGFloat(i), y: 0, width: self.view.frame.width, height: self.view.frame.height)
        }
        
        scrollView.delegate = self
        return scrollView
    }()
    
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = cityViews.count
        pageControl.currentPage = loadingPage
        pageControl.addTarget(self, action: #selector(pageControlTapHaddler(sender:)), for: .valueChanged)
        return pageControl
    }()
    
    enum Consts {
        enum ManageButton {
            static let image = UIImage(systemName: "list.dash")
            static let color: (white: CGFloat, alpha: CGFloat) = (1, 0.5)
        }
        enum WeatherLinkButton {
            static let image = UIImage(named: "the-weather-channel")
            static let alpha: CGFloat = 0.5
            static let width: CGFloat = 25
        }
        enum PageControl {
            static let height: CGFloat = 50
            static let bottomSpacing: CGFloat = -12
        }
        enum Margins {
            static let leading: CGFloat = 20
            static let trailing: CGFloat = -20
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //ios[13..15)
        //Рассчет границ safearea (if #available(iOS 13.0, *) {)
        let window = UIApplication.shared.windows.first
        bottomPadding = window?.safeAreaInsets.bottom
        
        configureView()
        configureMainWeatherInfo()
        setupSubviews()
        setupConstraints()
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        pageControl.currentPage = loadingPage
//    }
    
    private func configureView() {
        self.view.backgroundColor = .systemBackground
    }
    
    private func configureMainWeatherInfo() {
        manageButton.setImage(Consts.ManageButton.image, for: .normal)
        manageButton.tintColor = .init(white: Consts.ManageButton.color.white, alpha: Consts.ManageButton.color.alpha)
        manageButton.addTarget(self, action: #selector(didTapOnManageButton(sender:)), for: .touchUpInside)
        
        weatherLinkButton.setImage(Consts.WeatherLinkButton.image, for: .normal)
        weatherLinkButton.alpha = Consts.WeatherLinkButton.alpha
    }
    
    private func setupSubviews() {
        self.view.addSubview(scrollView)
        self.view.addSubview(pageControl)
        
        self.view.addSubview(manageButton)
        self.view.addSubview(weatherLinkButton)
    }
    
    private func setupConstraints() {
        //FIXME: why translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.heightAnchor.constraint(equalToConstant: Consts.PageControl.height).isActive = true
        pageControl.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        pageControl.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: Consts.PageControl.bottomSpacing).isActive = true
        
        // setup manageButton constraints
        manageButton.translatesAutoresizingMaskIntoConstraints = false
        manageButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: Consts.Margins.trailing).isActive = true
        manageButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        // setup weatherLinkButton constraints
        weatherLinkButton.translatesAutoresizingMaskIntoConstraints = false
        weatherLinkButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: Consts.Margins.leading).isActive = true
        weatherLinkButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        weatherLinkButton.widthAnchor.constraint(equalToConstant: Consts.WeatherLinkButton.width).isActive = true
        weatherLinkButton.heightAnchor.constraint(equalTo: weatherLinkButton.widthAnchor).isActive = true
    }
    
    @objc func pageControlTapHaddler(sender: UIPageControl) {
        scrollView.scrollTo(horisontalPage: sender.currentPage , animated: true)
    }
    
    @objc func didTapOnManageButton(sender: UIButton) {
        presenter.tapOnTheManage()
    }
    
}

extension MainWeatherViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = Int(round(scrollView.contentOffset.x / self.view.frame.width))
        pageControl.currentPage = pageIndex
    }
}

extension MainWeatherViewController: MainWeatherViewProtocol {
    func success() {
        print("")
    }
    
    func failure() {
        print("")
    }
}
