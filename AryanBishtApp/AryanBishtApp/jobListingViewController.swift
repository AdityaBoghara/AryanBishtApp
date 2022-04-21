//
//  jobListingViewController.swift
//  AryanBishtApp
//
//  Created by Aditya Boghara on 4/21/22.
//

import UIKit

class jobListingViewController: UIViewController,UITableViewDelegate {

    
   
    @IBOutlet weak var tableView: UITableView!
    
  
//    let job = [""]
//
//    let navyJob = ["AeroGrapher mate", "AirCrewMan", "Air Traffic Controller"]
//
//    let armyJob = ["Certified Nurse Midware","Urologist","Air and Missile Defence"]
    
    let job = ["In-flight refueling specialist","Flight engineer","Aircraft load master"]
    
//    var job = navyJob
//
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.navigationItem.title = "JOB LISTING"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "applicationPageSegue", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ApplicationViewController {
            destination.jobtitle=job[(tableView.indexPathForSelectedRow?.row)!]
            }
    }
    

}



extension jobListingViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return job.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text=job[indexPath.row]
        return cell
    }
}
