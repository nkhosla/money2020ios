//
//  EnterNewAccountInfo.swift
//  M2020Escrow
//
//  Created by Nathan khosla on 21 Oct 17.
//  Copyright © 2017 Nathan khosla. All rights reserved.
//

import UIKit
import TextFieldEffects
import MaterialComponents.MaterialDialogs

class EnterNewAccountInfo: UIViewController {
    
    
    
    @IBOutlet weak var firstNameField: AkiraTextField!
    @IBOutlet weak var secondNameField: AkiraTextField!
    @IBOutlet weak var emailField: AkiraTextField!
    @IBOutlet weak var passwordField: AkiraTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passwordField.isSecureTextEntry = true;
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    @IBAction func proceed(_ sender: Any) {
        print("proceed")
        
    }
    
    func showFieldNotCompelteDialog() {
        // Present a modal alert
        let alertController = MDCAlertController(title: "Warning", message: "Please complete all of the fields before continuing.")
        let action = MDCAlertAction(title:"OK") { (action) in print("OK") }
        alertController.addAction(action)
        
        present(alertController, animated:true, completion:nil)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        print("am in segue method")
        
        let h = UserRegestrationObject.sharedInstance
        
        guard let fn = firstNameField.text, firstNameField.text != "" else {
            showFieldNotCompelteDialog()
            return false
        }
        
        guard let ln = secondNameField.text, secondNameField.text != "" else {
            showFieldNotCompelteDialog()
            return false
        }
        
        guard let e = emailField.text, emailField.text != "" else{
            showFieldNotCompelteDialog()
            return false
        }
        
        guard let p = passwordField.text, passwordField.text != "" else {
            showFieldNotCompelteDialog()
            return false
        }
        
        // dont ask why I couldnt do this in the guard statements, but f-ing
        // xcode and swift threw a fit
        
        h.firstName = fn;
        h.lastName = ln;
        h.email = e;
        h.password = p;
        
        return true;
        
        
    }
    
}
