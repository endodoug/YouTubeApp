//
//  ViewController.swift
//  YouTubeApp
//
//  Created by doug harper on 11/19/15.
//  Copyright © 2015 Doug Harper. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, VideoModelDelegate {

    // AIzaSyDZ3E0pA2ER35KYjnWtCzRTc9ZiTjCn7_A
    
    @IBOutlet weak var tableView: UITableView!
    var videos: [Video] = [Video]()
    var selectedVideo: Video?
    let model: VideoModel = VideoModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        self.model.delegate = self
        //self.videos = VideoModel().getVideos()
        
        // send off request to get videos
        model.getFeedVideos()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: VideoModel Delegate Methods
    
    func dataReady() {
        
        // Access the video objects that have been downloaded
        self.videos = self.model.videoArray
        
        // Tell tableview to reload
        self.tableView.reloadData()
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
        
        // Get the label for the cell
        let label = cell.viewWithTag(2) as! UILabel
        label.text = videoTitle
        
        // Customize our cell to display the video title
        //cell.textLabel?.text = videoTitle
        
        // Construct the video thumbnail
        let videoThumbnailUrlString = videos[indexPath.row].videoThumbnailURL
        
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
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // take note of which cell was selected
        self.selectedVideo = self.videos[indexPath.row]
        
        // call the segue
        self.performSegueWithIdentifier("goToDetail", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // get reference for destination viewController
        let detailViewController = segue.destinationViewController as! VideoDetailViewController
        
        // set the selected video property of the destination viewController
        detailViewController.selectedVideo = self.selectedVideo
        
    }


}

