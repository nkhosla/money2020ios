//
//  UserLoginViewController.swift
//  M2020Escrow
//
//  Created by Nathan khosla on 21 Oct 17.
//  Copyright © 2017 Nathan khosla. All rights reserved.
//

import UIKit
import TextFieldEffects
import MaterialComponents.MaterialDialogs
import MaterialComponents
import Alamofire
import SwiftyJSON

class UserLoginViewController: UIViewController {

    @IBOutlet weak var passwordField: AkiraTextField!
    @IBOutlet weak var emailField: AkiraTextField!
    let activityIndicator = MDCActivityIndicator(frame: CGRect(x: 0, y: 0, width: 32, height: 32))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passwordField.isSecureTextEntry = true;
        
        let tapfiller = UITapGestureRecognizer(target: self, action: #selector(fillInFields) );
        tapfiller.numberOfTapsRequired = 3
        
        navigationController?.navigationBar.addGestureRecognizer(tapfiller)
        

        // Do any additional setup after loading the view.
    }
    
    @objc func fillInFields() {
        self.emailField.text = "alice@gmail.com"
        self.passwordField.text = "bar"
    }
    
    func filterTheGoddamnFuglyResponse(response: String) {
        // so the format is "HTTP Response Body: {\n  \"SECRET_KEY\": \"YOLO420\", \n  \"UID\": 5\n}\n"
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showFieldNotCompelteDialog() {
        // Present a modal alert
        let alertController = MDCAlertController(title: "Uh Oh!", message: "Did you forget something? Please complete all of the fields before continuing.")
        let action = MDCAlertAction(title:"OK") { (action) in print("OK") }
        alertController.addAction(action)
        
        present(alertController, animated:true, completion:nil)
    }
    
    func userCanSignIn() -> Bool {
        guard let num = passwordField.text, passwordField.text != "" else {
            showFieldNotCompelteDialog()
            return false
        }
        
        guard let name = emailField.text, emailField.text != "" else {
            showFieldNotCompelteDialog()
            return false
        }
        
        return true;
        
    }
    
    func sendLoginRequest(email:String, pass:String) {

        /**
         Request
         get https://igloo2020.herokuapp.com/users/login
         */
        
        // Add URL parameters
        let urlParams = [
            "email":email,
            "password":pass,
            ]
        
        print(email,pass)
        
       // Alamofire.request("https://httpbin.org/get", parameters: urlParams) // encoding defaults to `URLEncoding.default`
        
        // /**
        // Fetch Request
        Alamofire.request("https://igloo2020.herokuapp.com/users/login", method: .get, parameters: urlParams)
            .validate(statusCode: 200..<300)
            .responseJSON { response in
                self.activityIndicator.stopAnimating()
                
                guard let responseData = response.data else {
                    return
                }
//                {
//                    "SECRET_KEY": "YOLO420",
//                    "UID": 5
//                }
                

                if (response.result.error == nil) {
                    let json = JSON(data: responseData)
                    guard let secretKey = json["SECRET_KEY"].string,
                        let uid = json["UID"].int else {
                            // @TODO: handle error/ different response
                            return
                    }
                    
                    UserDefaults.standard.set(uid, forKey: "UID")
                    UserDefaults.standard.set(true, forKey:"hasLoggedIn")
                    
                    self.navigationController?.dismiss(animated: true, completion: nil)
 

                }
                else {
                    debugPrint("HTTP Request failed: \(response.result.error!)")
                }
        } // **/
    }

    
    @IBAction func signIn(_ sender: Any) {
        
        if userCanSignIn() {
            print("cansingin")
            self.view.addSubview(activityIndicator)
            
            // Start animation
            activityIndicator.startAnimating()
            
            sendLoginRequest(email:emailField.text!, pass:passwordField.text!)
            
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
