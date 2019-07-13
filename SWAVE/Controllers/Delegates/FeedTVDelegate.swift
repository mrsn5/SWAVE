//
//  FeedTVDelegate.swift
//  SWAVE
//
//  Created by San Byn Nguyen on 7/13/19.
//  Copyright © 2019 San Byn Nguyen. All rights reserved.
//

import UIKit

class FeedTVDelegate: NSObject, UITableViewDelegate {

    let viewController: UIViewController!
    
    init(viewController vc: UIViewController) {
        self.viewController = vc
        super.init()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let feedDS = tableView.dataSource as? FeedDataSource else {return}
        let feed = feedDS.feed[indexPath.row]
        viewController.performSegue(withIdentifier: "FeedInfo", sender: feed)
    }
}
