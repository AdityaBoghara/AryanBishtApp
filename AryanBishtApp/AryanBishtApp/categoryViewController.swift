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
    
    @IBAction func armyButton(_ sender: Any) {
        navigationItem.title = armyButton.currentTitle
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
