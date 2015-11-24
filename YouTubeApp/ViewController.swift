//
//  ViewController.swift
//  YouTubeApp
//
//  Created by doug harper on 11/19/15.
//  Copyright © 2015 Doug Harper. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var videos: [Video] = [Video]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.videos = VideoModel().getVideos()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //: MARK Tableview Protocols
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("BasicCell")!
        
        let videoTitle = videos[indexPath.row].videoTitle
        
        // Customize our cell to display the video title
        cell.textLabel?.text = videoTitle
        
        return cell
    }


}

