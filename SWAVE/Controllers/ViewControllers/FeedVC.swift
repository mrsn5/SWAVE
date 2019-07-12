//
//  FeedVC.swift
//  SWAVE
//
//  Created by San Byn Nguyen on 7/6/19.
//  Copyright © 2019 San Byn Nguyen. All rights reserved.
//

import UIKit

class FeedVC: UIViewController, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    let dataSource = FeedDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = dataSource
        tableView.delegate = self
        
        DataService.instanse.getAllFeedRecords { (feed, error) in
            guard let feed = feed else {
                debugPrint("Error while fetching feed data: \(String(describing: error?.localizedDescription))")
                return
            }
            
            self.dataSource.feed = feed
            self.tableView.reloadData()
        }
    }
    

}
