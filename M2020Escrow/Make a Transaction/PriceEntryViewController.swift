//
//  PriceEntryViewController.swift
//  M2020Escrow
//
//  Created by Nathan khosla on 22 Oct 17.
//  Copyright © 2017 Nathan khosla. All rights reserved.
//

import UIKit
import MaterialComponents
import TextFieldEffects

class PriceEntryViewController: UIViewController {

    @IBOutlet weak var priceField: AkiraTextField!
    
    @IBOutlet weak var descField: AkiraTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "The Item"
        
        let progressView = MDCProgressView()
        progressView.progress = 0.4
        
        let progressViewHeight = CGFloat(3)
        progressView.frame = CGRect(x: 0, y: 65, width: view.bounds.width, height: progressViewHeight)
        view.addSubview(progressView)

        // Do any additional setup after loading the view.
        
        let tapfiller = UITapGestureRecognizer(target: self, action: #selector(fillInFields) );
        tapfiller.numberOfTapsRequired = 3
        
        navigationController?.navigationBar.addGestureRecognizer(tapfiller)
        
        
    }
    
    @objc func fillInFields() {
        self.priceField.text = "800.00"
        self.descField.text = "Space Grey iPhone X 128GB"
    
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
    
    func showFieldNotCompelteDialog() {
        // Present a modal alert
        let alertController = MDCAlertController(title: "Uh Oh!", message: "Did you forget something? Please complete all of the fields before continuing.")
        let action = MDCAlertAction(title:"OK") { (action) in print("OK") }
        alertController.addAction(action)
        
        present(alertController, animated:true, completion:nil)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        let ts = TransactionStore.sharedInstance
        
        print("am in segue method")
        
        guard let p = priceField.text, priceField.text != "" else {
            showFieldNotCompelteDialog()
            return false
        }
        
        guard let d = descField.text, descField.text != "" else {
            showFieldNotCompelteDialog()
            return false
        }
        
        
        // dont ask why I couldnt do this in the guard statements, but f-ing
        // xcode and swift threw a fit
        
        ts.desc = d;
        ts.price = p;
        
        return true;
    }
        
    }



