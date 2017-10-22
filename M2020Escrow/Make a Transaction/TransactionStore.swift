//
//  TransactionStore.swift
//  M2020Escrow
//
//  Created by Nathan khosla on 22 Oct 17.
//  Copyright © 2017 Nathan khosla. All rights reserved.
//

import UIKit

class TransactionStore: NSObject {

    var itemType: Int
    var uid: String
    var desc: String
    var price: String
    
    override init() {
        
        // This is my disgusting way to avoid using optionals. Please dont judge me
        itemType = -1;
        uid = "";
        desc = ""
        price = ""
        

        
        super.init()
    }
    
    static let sharedInstance = TransactionStore()
    
}
