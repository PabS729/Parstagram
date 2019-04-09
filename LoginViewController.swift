//
//  LoginViewController.swift
//  Parstagram
//
//  Created by Minjing Shi on 4/2/19.
//  Copyright © 2019 Minjing Shi. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var NameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func OnLogin(_ sender: Any) {
        let username = NameField.text!
        let password = passwordField.text!
        PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) in
            if user != nil {
                self.performSegue(withIdentifier: "LoginSeg", sender: nil)
            }
            else {
                print("Error:\(String(describing: error?.localizedDescription))")
            }
        }
    }
    
    @IBAction func OnSignUp(_ sender: Any) {
        let user = PFUser()
        
        user.username = NameField.text
        user.password = passwordField.text
        
        
        user.signUpInBackground {
            (success,error) in
            if success {
                self.performSegue(withIdentifier: "LoginSeg", sender: nil)
            }
            else {
                print("Error:\(String(describing: error?.localizedDescription))")
            }
        }
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
