//
//  pinViewController.swift
//  M2020Escrow
//
//  Created by Nathan khosla on 22 Oct 17.
//  Copyright © 2017 Nathan khosla. All rights reserved.
//

import UIKit
import MaterialComponents
import Alamofire

class pinViewController: UIViewController {

    @IBOutlet weak var pinLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = "Your PIN"
        
        let progressView = MDCProgressView()
        progressView.progress = 1.0
        
        let progressViewHeight = CGFloat(3)
        progressView.frame = CGRect(x: 0, y: 65, width: view.bounds.width, height: progressViewHeight)
        view.addSubview(progressView)
        
        sendMakeATransactionRequest()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func random(_ n:Int) -> Int
    {
        return Int(arc4random_uniform(UInt32(n)))
    }
    
    func sendMakeATransactionRequest() {

        /**
         Make a transaction
         get https://igloo2020.herokuapp.com/transactions/create
         */
        
        let ts = TransactionStore.sharedInstance
        
        // Add URL parameters
        
        let urlParams = [
            "type": String(ts.itemType),
            "price":ts.price,
            "uid":ts.uid,
            "item":ts.desc,
            ]
        
        // Fetch Request
        Alamofire.request("https://igloo2020.herokuapp.com/transactions/create", method: .get, parameters: urlParams)
            .validate(statusCode: 200..<300)
            .responseString { response in
                if (response.result.error == nil) {
                    debugPrint("HTTP Response Body: \(response.data)")
                    let pin = String(data: response.data!, encoding: String.Encoding.ascii)
                    print(pin)
                    

                    let newPin1 = self.random(999)
                    let newPin2 = self.random(999)
                    let nps1 = String(newPin1)
                    let nps2 = String(newPin2)
                    
                    
                    
                    let nps = nps1 + " " + nps2
                    
                    self.pinLabel.text = nps
                    //p = pin.sub
                    
                    
                }
                else {
                    debugPrint("HTTP Request failed: \(response.result.error)")
                }
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
