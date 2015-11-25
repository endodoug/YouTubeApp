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
    
    //: Set TableView Cell height
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        // calculate the width of screen to calculate the height of the row
         return (self.view.frame.size.width / 320) * 180
        
        
    }
    
    //: MARK Tableview Protocols
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("BasicCell")!
        
        let videoTitle = videos[indexPath.row].videoTitle
        
        // Customize our cell to display the video title
        //cell.textLabel?.text = videoTitle
        
        // Construct the video thumbnail
        let videoThumbnailUrlString = "https://i1.ytimg.com/vi/" + videos[indexPath.row].videoId + "/maxresdefault.jpg"
        
        // Create a NSURL object
        let videoThumbnailUrl = NSURL(string: videoThumbnailUrlString)
        
        if videoThumbnailUrl != nil {
            
            // Create a NSURLRequest object
            let request = NSURLRequest(URL: videoThumbnailUrl!)
            
            // Create a NSURLSession
            let session = NSURLSession.sharedSession()
            
            // Create a datatask and pass in the request
            let dataTask = session.dataTaskWithRequest(request, completionHandler: { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
                
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    
                    // Get a reference to the imageview element of the cell
                    let imageView = cell.viewWithTag(1) as! UIImageView
                    
                    // Create an image object from the data and assign it into the imageview
                    imageView.image = UIImage(data: data!)
                    
                })
                
            })
            
            dataTask.resume()
            
    
        }
    
        return cell
    }


}

