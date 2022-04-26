//
//  signUpViewController.swift
//  AryanBishtApp
//
//  Created by Aditya Boghara on 4/22/22.
//

import UIKit
import FirebaseAuth
import Firebase
import SwiftUI
import UniformTypeIdentifiers

class signUpViewController: UIViewController {
    
    @State var show = false
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var documentPicker: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    
    
    
    //check the fields and validate that the field data is correct. If everything is correct this method returns nil wlse returns the error message as string
    
    func validateFields() ->  String?{
        
        // check that all fields are filled in
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            phoneNumberTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""  ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
            return "Please Fill in all Fields."
        }
        
        //check if the password is secured!!
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanedPassword) == false{
            return "Please make sure your password is secure and it contain atleast * characters. Also make sure it contain special characted and a number"
        }
        
        
        return nil
    }
    
    
    
    @IBAction func signUpTapped(_ sender: Any) {
        
        //validate the fields
        let error = validateFields()
        
        if error != nil{
            
//            there is something wrong with the field show wrror message
            showError(error!)
            
        }else{
            // create clenaed version of the data
            let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let phoneNumber = phoneNumberTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            
            
        //create the user
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                
                //check for errors
                if err != nil {
                    //there was an error
                    self.showError("Error creating User")
                }
                else{
//                    if there is no error
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data: ["firstname":firstName, "lastname":lastName,"uid":result!.user.uid, "phonenumber":phoneNumber]) { (error) in
                        if error != nil{
                            self.showError("Error Saving user data")
                        }
                    }
                    //transition to the home screen
                    
                    self.transitionToHome()
                    
                    
                }
            }
        
       
            
        }
        
    }
    
    func showError(_ message:String){
        errorLabel.text = message
        errorLabel.alpha = 1
        
    }
    
    
    func transitionToHome(){
        
        let startPageViewController = storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.startPageViewController) as? StartPageViewController
        
        
        view.window?.rootViewController = startPageViewController
        view.window?.makeKeyAndVisible()

    }
    
    @IBAction func AddMusic(_ sender: UIButton) {
        let supportedTypes: [UTType] = [UTType.pdf]
        let pickerViewController = UIDocumentPickerViewController(forOpeningContentTypes: supportedTypes, asCopy: true)
        pickerViewController.delegate = self
        pickerViewController.allowsMultipleSelection = false
        pickerViewController.shouldShowFileExtensions = true
        self.present(pickerViewController, animated: true, completion: nil)
        
        
    }
    
    
    
    

}

extension signUpViewController: UIDocumentPickerDelegate{
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]){
        guard let myURL = urls.first else {
               return
           }
           print("import result : \(myURL)")
    }
}

//        let StartPageViewController = storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.startPageViewController) as! StartPageViewController
//                self.present(StartPageViewController, animated: true, completion: nil)
        

    


