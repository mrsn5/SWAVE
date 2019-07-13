//
//  FeedInfoVC.swift
//  SWAVE
//
//  Created by San Byn Nguyen on 7/6/19.
//  Copyright © 2019 San Byn Nguyen. All rights reserved.
//

import UIKit

class FeedInfoVC: UIViewController {

    var feed: Feed?
    
    @IBOutlet weak var topicLbl: UILabel!
    @IBOutlet weak var messageTxt: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure() {
        topicLbl.text = feed?.topic ?? ""
        messageTxt.text = feed?.message ?? ""
    }
    
    @IBAction func backPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func connectPressed(_ sender: Any) {
    }
}
