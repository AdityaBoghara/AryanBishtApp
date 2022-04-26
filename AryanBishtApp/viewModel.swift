//
//  viewModel.swift
//  AryanBishtApp
//
//  Created by Aditya Boghara on 4/25/22.
//

import Foundation
import Firebase

class viewModel: ObservableObject{
    @Published var jobList = [job]()
    
    func getData(){
        
        //get a reference to the db
        let db = Firestore.firestore()
        
//        read document at a specific path
        db.collection("navyJobs").getDocuments { snapshot, error in
            //check for errors
            if error == nil{
                //no errors
                
                if let snapshot = snapshot {
//                    update the list property in the main thread
                    DispatchQueue.main.async {
                        
//                        get all doc and create a job list
                                           self.jobList=snapshot.documents.map { d in
                                               return job(id: d.documentID, jobTitle: d["jobTitle"] as? String ?? "", jobDescription: d["jobDescription"] as? String ?? "")
                                           }
                        
                    }

                }
                
            }else{
                //handle the error
                
                
            }
            
        }
        
        
    }
    
}
