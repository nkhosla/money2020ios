//
//  EnterNewAccountCCViewController.swift
//  M2020Escrow
//
//  Created by Nathan khosla on 21 Oct 17.
//  Copyright © 2017 Nathan khosla. All rights reserved.
//

import UIKit
import TextFieldEffects
import MaterialComponents.MaterialDialogs

class EnterNewAccountCCViewController: UIViewController {

    @IBOutlet weak var ccNameField: AkiraTextField!
    @IBOutlet weak var ccNumberField: AkiraTextField!
    @IBOutlet weak var ccMMField: AkiraTextField!
    @IBOutlet weak var ccYYYYField: AkiraTextField!
    @IBOutlet weak var ccCVVField: AkiraTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
    @IBAction func useCameraForCardInput(_ sender: Any) {
        // Present a modal alert
        let alertController = MDCAlertController(title: "Sorry!", message: "We have not implemented this yet. Rest assured, the ability to use your camera to enter your debit card is coming soon for your convenience.")
        let action = MDCAlertAction(title:"OK") { (action) in print("OK") }
        alertController.addAction(action)
        
        present(alertController, animated:true, completion:nil)
    }
    
    func showFieldNotCompelteDialog() {
        // Present a modal alert
        let alertController = MDCAlertController(title: "Uh Oh!", message: "Did you forget something? Please complete all of the fields before continuing.")
        let action = MDCAlertAction(title:"OK") { (action) in print("OK") }
        alertController.addAction(action)
        
        present(alertController, animated:true, completion:nil)
    }
    
    

}
