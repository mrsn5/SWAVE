//
//  FeedVC.swift
//  SWAVE
//
//  Created by San Byn Nguyen on 7/6/19.
//  Copyright © 2019 San Byn Nguyen. All rights reserved.
//

import UIKit

class FeedVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let dataSource = FeedDataSource()
    var tableDelegate: FeedTVDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableDelegate = FeedTVDelegate(viewController: self)
        
        tableView.separatorStyle = .none
        tableView.dataSource = dataSource
        tableView.delegate = tableDelegate
        
        DataService.instanse.getAllFeedRecords { (feed, error) in
            guard let feed = feed else {
                debugPrint("Error while fetching feed data: \(String(describing: error?.localizedDescription))")
                return
            }
            
            self.dataSource.feed = feed
            self.tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let feedInfoVC = segue.destination as? FeedInfoVC {
            guard let feed = sender as? Feed else {return}
            feedInfoVC.feed = feed
        } 
    }
}
