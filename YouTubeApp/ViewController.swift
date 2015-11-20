//
//  ViewController.swift
//  YouTubeApp
//
//  Created by doug harper on 11/19/15.
//  Copyright © 2015 Doug Harper. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var videos: [Video] = [Video]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.videos = VideoModel().getVideos()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

