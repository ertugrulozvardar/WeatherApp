//
//  WeatherConditionViewController.swift
//  WeatherApp
//
//  Created by pc on 27.08.2022.
//

import UIKit
import CoreLocation

class WeatherConditionViewController: UIViewController {

    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var weatherDegreeLabel: UILabel!
    @IBOutlet weak var weatherForecastTableView: UITableView! {
        didSet {
            weatherForecastTableView.dataSource = self
            weatherForecastTableView.register(UINib(nibName: String(describing: WeatherConditionTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: WeatherConditionTableViewCell.self))
        }
    }
    
    var locationManager = CLLocationManager()
    var geocoder = CLGeocoder()
    var currentWeatherViewModel = CurrentWeatherViewModel()
    var weatherViewModel = WeatherViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        initializeLocationManager()
        initalizeCurrentWeatherViewModel()
        initializeWeatherViewModel()
    }
    
    func initializeLocationManager() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        locationManager.startUpdatingLocation()
        locationManager.allowsBackgroundLocationUpdates = true
    }
    
    func initializeWeatherViewModel(){
        weatherViewModel.reloadTableView = { [weak self] in
                self?.weatherForecastTableView.reloadData()
        }
        weatherViewModel.showError = {
            DispatchQueue.main.async { 
                print("Something went wrong while getting the weather data..")
            }
        }
    }
    
    func initalizeCurrentWeatherViewModel() {
        let currentViewModel = currentWeatherViewModel.getCurrentWeatherViewModel()
        //weatherIcon.text
        weatherDegreeLabel.text = currentViewModel.temperatureText
    }
}

//MARK: TableView DataSource Related Methods
extension WeatherConditionViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherViewModel.numberOfCells
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: WeatherConditionTableViewCell.self), for: indexPath) as? WeatherConditionTableViewCell else {
            fatalError("No results found.")
        }
        let cellVM = weatherViewModel.getCellViewModel( at: indexPath )
        cell.dayLabel.text = cellVM.dayText
        cell.maxTemperatureLabel.text = cellVM.maxTemperatureText
        cell.minTemperatureLabel.text = cellVM.minTemperatureText
        return cell
    }
}

extension WeatherConditionViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            currentWeatherViewModel.getWeatherData(latitudeValue: lat, longitudeValue: lon)
            weatherViewModel.getWeatherData(latitudeValue: lat, longitudeValue: lon)
            geocoder.reverseGeocodeLocation(location) { placemarks, error in
                if let error = error {
                    debugPrint(error.localizedDescription)
                }
                if let placemarks = placemarks {
                    if placemarks.count > 0 {
                        let placemark = placemarks[0]
                        if let city = placemark.locality {
                            self.cityNameLabel.text = city
                        }
                    }
                }
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
