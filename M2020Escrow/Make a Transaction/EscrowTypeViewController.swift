//
//  EscrowTypeViewController.swift
//  M2020Escrow
//
//  Created by Nathan khosla on 22 Oct 17.
//  Copyright © 2017 Nathan khosla. All rights reserved.
//

import UIKit
import MaterialComponents

class EscrowTypeViewController: UIViewController {
    
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.

        self.navigationItem.title = "The Item"
        let progressView = MDCProgressView()
        progressView.progress = 0.2
        
        let progressViewHeight = CGFloat(3)
        progressView.frame = CGRect(x: 0, y: 65, width: view.bounds.width, height: progressViewHeight)
        view.addSubview(progressView)
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
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        print("am in segue method")
        
        let ts = TransactionStore.sharedInstance
        
        var shouldSegue = true
        
        switch identifier {
        case "phoneSegue":
            ts.itemType = 1;
            
        case "contractSegue":
            ts.itemType = 2;
            
        case "otherSegue":
            ts.itemType = 3;
            
        case "pinSegue":
            print("pin")
            
        default:
            ts.itemType = -1;
            shouldSegue = false
        }
        
        ts.uid = UserDefaults.standard.string(forKey: "UID")!
        
        return shouldSegue;
        
    }

}
