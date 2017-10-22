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
        
        // So though we could login properly, we are making these quick gestures to login
        //so that we can get on with our lives both in development and in the demos
        /** let loginAliceQuickGesture = UITapGestureRecognizer(target: self, action: #selector(logAliceIn) );
        tapfiller.numberOfTapsRequired = 3
        
        navigationController?.navigationBar.addGestureRecognizer(loginAliceQuickGesture)
        
        
        let loginPableQuickGesture = UITapGestureRecognizer(target: self, action: #selector(logPabloIn) );
        tapfiller.numberOfTapsRequired = 2
        
        navigationController?.navigationBar.addGestureRecognizer(loginPableQuickGesture) **/
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func logPabloIn() {
         let hasLoggedInBefore = UserDefaults.standard.bool(forKey: "hasLoggedIn");
        
    }
    
    func logAliceIn() {
        
        
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
         print("the vc from first signup flow storyboard dint load")
         return;
         };
        
        //let vc =
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func signIn(_ sender: Any) {
        let vc = UserLoginViewController(nibName: "UserLoginViewController", bundle: nil)
        
        
        self.navigationController?.pushViewController(vc, animated: true)
        print("pressed sign in")
    }
}
