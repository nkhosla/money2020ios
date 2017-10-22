//
//  UserRegestrationObject.swift
//  M2020Escrow
//
//  Created by Nathan khosla on 21 Oct 17.
//  Copyright © 2017 Nathan khosla. All rights reserved.
//

import UIKit

class UserRegestrationObject: NSObject {
    
    var firstName: String
    var lastName: String
    var email: String
    var password: String
    var ccName: String
    var ccNumber: String
    var ccExpMM: String
    var ccExpYYYY: String
    var ccCVV: String
    
    override init() {
        
        // This is my disgusting way to avoid using optionals. Please dont judge me
        firstName = ""
        lastName = ""
        email = ""
        password = ""
        ccName = ""
        ccNumber = ""
        ccExpYYYY = ""
        ccCVV = ""
        ccExpMM = ""
        
        super.init()
    }
 
    static let sharedInstance = UserRegestrationObject()
    

}
