//
//  jobListingViewController.swift
//  AryanBishtApp
//
//  Created by Aditya Boghara on 4/21/22.
//




import UIKit

//struct job{
//
//    var id:String
//    var jobTitle:String
//    var jobDescription: String
//
//}



class jobListingViewController: UIViewController,UITableViewDelegate {

    
    @IBOutlet weak var jobListNavBar: UINavigationBar!
    
    @IBOutlet weak var tableView: UITableView!
    
   var jobTitle: String?
    
//    var jobList: [job] = [job]()
    
    
  
    let job = ["AeroGrapher mate", "AirCrewMan", "Air Traffic Controller"]
//
//    let navyJob = ["AeroGrapher mate", "AirCrewMan", "Air Traffic Controller"]
//
//    let armyJob = ["Certified Nurse Midware","Urologist","Air and Missile Defence"]
//
//    let airforceJob = ["In-flight refueling specialist","Flight engineer","Aircraft load master"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        jobListNavBar.topItem?.title=jobTitle
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "applicationPageSegue", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ApplicationViewController {
            destination.jobtitle=job[(tableView.indexPathForSelectedRow?.row)!]
            }
//        tableView.deselectRow(at: tableView.indexPathForSelectedRow!, animated: true)
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
