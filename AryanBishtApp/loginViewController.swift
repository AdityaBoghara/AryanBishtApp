//
//  loginViewController.swift
//  AryanBishtApp
//
//  Created by Aditya Boghara on 4/22/22.
//

import UIKit
import Firebase
import FirebaseAuth

class loginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
   
    

    override func viewDidLoad() {
        super.viewDidLoad()
       

        // Do any additional setup after loading the view.
//        details(email: emailTextField.text ?? "")
    }
    
    
    
    
    func validateFields() ->  String?{
        
        // check that all fields are filled in
        if emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""  ||
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
    
    
    @IBAction func loginButtonTapped(_ sender: Any) {
//        validate the text fields
        
        let error = validateFields()
        
        if error != nil{
            
//            there is something wrong with the field show wrror message
            showError(error!)
            
        }else{
            // create clenaed version of the data
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            
            
        //signin  the user
            Auth.auth().signIn(withEmail: email, password: password) { (result, err) in
                
                //check for errors
                if err != nil {
                    //there was an error
                    self.showError("Error Signin User")
                }
                else{
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
    
    
    
    
    

    

}
