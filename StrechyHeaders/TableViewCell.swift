//
//  TableViewCell.swift
//  StrechyHeaders
//
//  Created by Shaun Campbell on 2016-10-11.
//  Copyright © 2016 Shaun Campbell. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var headLineTextView: UITextView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    weak var newsStory: NewsStory? {
        didSet {
            if let newsStory = newsStory {
                headLineTextView.text = newsStory.headline
                categoryLabel.text = newsStory.category
            }
        }
    }
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
