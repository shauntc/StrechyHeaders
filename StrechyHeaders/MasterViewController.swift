//
//  MasterViewController.swift
//  StrechyHeaders
//
//  Created by Shaun Campbell on 2016-10-11.
//  Copyright © 2016 Shaun Campbell. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    
    @IBOutlet weak var headerView: UIView!
    var detailViewController: DetailViewController? = nil
    var objects = [NewsStory]()
    
    let kTableHeaderHeight:CGFloat = 100

    override var prefersStatusBarHidden: Bool{
        get{
            return true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        
        if let navigationController = navigationController {
            navigationController.isNavigationBarHidden = true
            navigationController.hidesBarsOnTap = true
        }
        
        tableView.tableHeaderView = nil
        tableView.addSubview(headerView)
        
        headerView.frame = CGRect(x: 0, y: 0, width: tableView.frame.width, height: kTableHeaderHeight)
        
        tableView.contentInset = UIEdgeInsets(top: kTableHeaderHeight, left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0, y: -kTableHeaderHeight)
        
        
        

        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject(_:)))
        self.navigationItem.rightBarButtonItem = addButton
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func insertNewObject(_ sender: Any) {
        objects.append(NewsStory(headline: "Climate change protests, divestments meet fossil fuels realities", category: "World"))
        let indexPath = IndexPath(row: objects.count - 1, section: 0)
        self.tableView.insertRows(at: [indexPath], with: .automatic)
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let object = objects[indexPath.row] 
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = object
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        objects.sort { (story1, story2) -> Bool in
            if story1.category < story2.category {
                return true
            }else{
                return false
            }
        }
        
        
        
        
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TableViewCell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! TableViewCell

        let object = objects[indexPath.row]
        
        cell.newsStory = object
        
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            objects.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
    
    //MARK Methods
    
    func updateHeaderView(){
        if tableView.contentOffset.y <= 0
        {
            headerView.frame = CGRect(x: 0 , y:tableView.contentOffset.y, width: tableView.frame.width, height: -tableView.contentOffset.y + kTableHeaderHeight)            
        }else{
            headerView.frame = CGRect(x: 0 as CGFloat, y: 0, width: tableView.frame.width, height: kTableHeaderHeight)
        }
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateHeaderView()
    }


}

