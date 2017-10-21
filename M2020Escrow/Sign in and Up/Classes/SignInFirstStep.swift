//
//  SignInFirstStep.swift
//  M2020Escrow
//
//  Created by Nathan khosla on 21 Oct 17.
//  Copyright © 2017 Nathan khosla. All rights reserved.
//

import UIKit

class SignInFirstStep: UIViewController {

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

    @IBAction func signUp(_ sender: Any) {
        print("pressed sign up")
         let sb = UIStoryboard(name: "NewUserSignUpFlow", bundle: nil);
        
         guard let vc = sb.instantiateInitialViewController() else {
         print("the vc from first login flow storyboard dint load")
         return;
         };
        
        //let vc =
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func signIn(_ sender: Any) {
        print("pressed sign in")
    }
}
