//
//  jobListing.swift
//  AryanBishtApp
//
//  Created by Aditya Boghara on 4/25/22.
//

import Foundation

struct job:Identifiable{
    
    var id:String
    var jobTitle:String
    var jobDescription: String
    
    init(id: String, jobTitle:String, jobDescription: String){
        self.id = id
        self.jobTitle=jobTitle
        self.jobDescription=jobDescription
        
    }
    
    
}
