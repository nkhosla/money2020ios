//
//  FIinalConfirmationViewController.swift
//  M2020Escrow
//
//  Created by Nathan khosla on 22 Oct 17.
//  Copyright © 2017 Nathan khosla. All rights reserved.
//

import UIKit
import MaterialComponents

class FIinalConfirmationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view. let alertController = MDCAlertController(title: "Agree and Pay", message: "If you continue, you will be charged the full amount for this transaction and the seller will release the item to you.")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /** @IBAction func agree(_ sender: Any) {
        let alertController = MDCAlertController(title: "Agree and Pay", message: "If you continue, you will be charged the full amount for this transaction and the seller will release the item to you.")
        let action = MDCAlertAction(title:"Pay") { (action) in print("Pay") }
        alertController.addAction(action)
        
        present(alertController, animated:true, completion:nil)
    }
    
    @IBAction func disagree(_ sender: Any) {
        let alertController = MDCAlertController(title: "Cancel Transaction", message: "If you cancel, not pay anything and you will not receive the item. If you wish to buy the item later, the seller will have to make a new transaction.")
        let action = MDCAlertAction(title:"Cancel") { (action) in print("Pay") }
        alertController.addAction(action)
        
        present(alertController, animated:true, completion:nil)
    }
 **/
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
