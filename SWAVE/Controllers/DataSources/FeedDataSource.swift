//
//  FeedDataSource.swift
//  SWAVE
//
//  Created by San Byn Nguyen on 7/12/19.
//  Copyright © 2019 San Byn Nguyen. All rights reserved.
//

import UIKit

class FeedDataSource: NSObject, UITableViewDataSource {
    
    var feed = [Feed]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feed.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FeedCell") as? FeedTCell else {return FeedTCell()}
        cell.configure(feed: feed[indexPath.row])
        return cell
    }
}
