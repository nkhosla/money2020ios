//
//  ViewController.swift
//  M2020Escrow
//
//  Created by Nathan khosla on 21 Oct 17.
//  Copyright © 2017 Nathan khosla. All rights reserved.
//

import UIKit
import MaterialComponents

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Check if we should show the first launch flow
        
        let hasLoggedInBefore = UserDefaults.standard.bool(forKey: "hasLoggedIn");
        
        if !hasLoggedInBefore {

            print("has not logged in before");
            /**          let sb = UIStoryboard(name: "NewUserFlow", bundle: nil);
             guard let vc = sb.instantiateInitialViewController() else {
             print("the vc from first login flow storyboard dint load")
             return;
             }; **/
            
            let vc = SignInFirstStep(nibName: "SignInFirstStep", bundle: nil)
            vc.title = "Sign In"
            let nc = UINavigationController(rootViewController: vc)
            
            self.present(nc, animated: true, completion: nil)
        }
            
        else {
            
            let floatingButton = MDCFloatingButton()
            floatingButton.setTitle("+", for: .normal)
            floatingButton.sizeToFit()
            floatingButton.frame = CGRect(x:307,y:590,width:56,height:56)
            floatingButton.addTarget(self, action: #selector(fabtapped), for: .touchUpInside)
            self.view.addSubview(floatingButton)
            
        }
        
    }
    
    @objc func fabtapped() {
        print("fab tapped")
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

