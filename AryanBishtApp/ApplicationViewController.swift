//
//  ApplicationViewController.swift
//  AryanBishtApp
//
//  Created by Aditya Boghara on 4/21/22.
//

import UIKit

class ApplicationViewController: UIViewController {

    @IBOutlet weak var JobTitle: UILabel!
    var jobtitle:String?
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        JobTitle.text = jobtitle
        
        
       
    }
    

    

}
