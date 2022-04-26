//
//  ApplicationViewController.swift
//  AryanBishtApp
//
//  Created by Aditya Boghara on 4/21/22.
//

import UIKit

class ApplicationViewController: UIViewController {

    @IBOutlet weak var JobTitle: UILabel!
    @IBOutlet weak var JobDescription: UILabel!
    @IBOutlet weak var submitApplication: UIButton!
    
    
    var jobtitle:String?
    var email:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        JobTitle.text = jobtitle
        
      
    }
    

    

}
