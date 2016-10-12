//
//  NewStory.swift
//  StrechyHeaders
//
//  Created by Shaun Campbell on 2016-10-11.
//  Copyright © 2016 Shaun Campbell. All rights reserved.
//

import UIKit

class NewsStory: NSObject {
    
    let headline: String
    let category: String
    
    init(headline:String, category:String) {
        self.headline = headline
        self.category = category
    }

}
