//
//  categoryViewController.swift
//  AryanBishtApp
//
//  Created by Aditya Boghara on 4/21/22.
//

import UIKit

class categoryViewController: UIViewController {

    @IBOutlet weak var armyButton: UIButton!
    @IBOutlet weak var airForceButton: UIButton!
    @IBOutlet weak var navyButton: UIButton!
    
    var buttonTitle:String = ""
    @IBAction func armyButton(_ sender: UIButton) {
        
        buttonTitle = (sender.titleLabel?.text)!
        
    }
    
    
    @IBAction func airForceButton(_ sender: UIButton) {
        buttonTitle = (sender.titleLabel?.text)!
        
    }
    
    @IBAction func navyButton(_ sender: UIButton) {
        buttonTitle = (sender.titleLabel?.text)!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let destination = segue.destination as? jobListingViewController {
//            destination.jobTitle=buttonTitle
//            }
    


//}
}
