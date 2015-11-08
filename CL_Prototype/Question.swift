//
//  question.swift
//  CL_Prototype
//
//  Created by Daniel Robertson on 08/11/2015.
//  Copyright © 2015 Daniel Robertson. All rights reserved.
//

import Foundation

class Question:NSObject {
    
    var title: String!
    
    
    init(title:String) {
        super.init()
        self.title = title
    }
}