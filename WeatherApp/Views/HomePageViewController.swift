//
//  HomePageViewController.swift
//  WeatherApp
//
//  Created by pc on 27.08.2022.
//

import UIKit

class HomePageViewController: UIViewController {

    @IBOutlet weak var apiKeyLabel: UILabel!
    @IBOutlet weak var enterButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func enterButtonPressed(_ sender: UIButton) {
        if let weatherConditionVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: WeatherConditionViewController.self)) as? WeatherConditionViewController {
            self.present(weatherConditionVC, animated: true, completion: nil)
        }
    }
}
