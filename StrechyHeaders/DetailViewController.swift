//
//  DetailViewController.swift
//  StrechyHeaders
//
//  Created by Shaun Campbell on 2016-10-11.
//  Copyright © 2016 Shaun Campbell. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!

    override var prefersStatusBarHidden: Bool{
        get{
            return true
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let label = self.detailDescriptionLabel {
                label.text = detail.description
            }
        }
        if let navigationController = navigationController {
            navigationController.isNavigationBarHidden = true
            navigationController.hidesBarsOnTap = true
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var detailItem: NewsStory? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }


}
