//
//  ViewController.swift
//  M2020Escrow
//
//  Created by Nathan khosla on 21 Oct 17.
//  Copyright © 2017 Nathan khosla. All rights reserved.
//

import UIKit
import MaterialComponents
import DZNEmptyDataSet

class ViewController: UIViewController, DZNEmptyDataSetSource, DZNEmptyDataSetDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.title = "My Transactions";
        
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
            
            self.tableView.emptyDataSetSource = self;
            self.tableView.emptyDataSetDelegate = self;
            
            // A little trick for removing the cell separators
            self.tableView.tableFooterView = UIView();
            
            
            
        }
        
        
    }
    
   func image(forEmptyDataSet scrollView: UIScrollView!) -> UIImage! {
        return UIImage(named: "LogoCircular")
    }
    
     func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
     let myString = "You do not have any transactions"
        let myAttribute = [ NSAttributedStringKey.foregroundColor: UIColor(red:0.423529412, green:0.478431373, blue:0.537254902, alpha:1.0),
     NSAttributedStringKey.font: UIFont(name:"HelveticaNeue-CondensedBold", size:32 )]
     let myAttrString = NSAttributedString(string: myString, attributes: myAttribute)
     
     return myAttrString
    }
    
    /**func description(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        
    }
    
    func buttonTitle(forEmptyDataSet scrollView: UIScrollView!, for state: UIControlState) -> NSAttributedString! {

    }**/
    
    func backgroundColor(forEmptyDataSet scrollView: UIScrollView!) -> UIColor! {
        // return UIColor(red: 0.894117647, green: 0.945098039, blue: 0.996078431, alpha: 1.0)
        return UIColor(red: 0.925490196, green: 0.925490196, blue: 0.925490196, alpha: 1.0)
    }
    

    @objc func fabtapped() {
        print("fab tapped")
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

