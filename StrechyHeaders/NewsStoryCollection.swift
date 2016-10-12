//
//  NewsStoryCollection.swift
//  StrechyHeaders
//
//  Created by Shaun Campbell on 2016-10-11.
//  Copyright © 2016 Shaun Campbell. All rights reserved.
//

import UIKit

class NewsStoryCollection: NSObject {
    
    var stories = Dictionary<String, [NewsStory]>()
 
    
    init(stories:[NewsStory]) {
        let sortedStories = stories.sorted { (newsStory1, newsStory2) -> Bool in
            if newsStory1.category > newsStory2.category{
                return true
            }else{
                return false
            }
        }
        
        //Build Dictionary of stories
        var currentCategory = ""
        for story in sortedStories{
            if story.category == currentCategory{
                self.stories[story.category]?.append(story)
            }else{
                currentCategory = story.category
                self.stories.updateValue([story], forKey: story.category)
            }
        }
        
    
        
        
    }
    
}
