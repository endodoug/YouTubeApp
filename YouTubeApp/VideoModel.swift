//
//  VideoModel.swift
//  YouTubeApp
//
//  Created by doug harper on 11/20/15.
//  Copyright © 2015 Doug Harper. All rights reserved.
//

import UIKit
import Alamofire

protocol VideoModelDelegate {
    func dataReady()
}

class VideoModel: NSObject {
    
    let API_KEY = "AIzaSyAPr_so6eHXUiJ3UGbIRpCcGM0JHhdJaqs"
    let UPLOADS_PlAYLIST_ID = "UUKAqou7V9FAWXpZd9xtOg3Q"
    
    var videoArray = [Video]()
    
    var delegate: VideoModelDelegate?
    
    func getFeedVideos() {
        
        // Dynamically fetch videos with YouTube API
        Alamofire.request(.GET, "https://www.googleapis.com/youtube/v3/playlistItems", parameters: ["part" : "snippet", "playlistId" :UPLOADS_PlAYLIST_ID, "key":API_KEY], encoding: ParameterEncoding.URL, headers: nil).responseJSON { (response) -> Void in
            
            if let JSON = response.result.value {
                
                var arrayOfVideos = [Video]()
                
                for video in JSON["items"] as! NSArray {
                    
                    // create video objects
                    let videoObj = Video()
                    videoObj.videoId = video.valueForKeyPath("snippet.resourceId.videoId") as! String
                    videoObj.videoTitle = video.valueForKeyPath("snippet.title") as! String
                    videoObj.videoDescription = video.valueForKeyPath("snippet.description") as! String
                    videoObj.videoThumbnailURL = video.valueForKeyPath("snippet.thumbnails.maxres.url") as! String
                    
                    arrayOfVideos.append(videoObj)
                }
                
                // After video objects are built, assign the array to the VideoModel property
                self.videoArray = arrayOfVideos
                
                // notify the delegate the data is ready
                if self.delegate != nil {
                    self.delegate!.dataReady()
                }
            }
            
        }
        
    }

    func getVideos() -> [Video] {
        
        // create an empty array of video objects
        var videos = [Video]()
        
        // create a video object 
        let video1 = Video()
        
        // assign properties
        video1.videoId = "_9gZ9x0cgQA"
        video1.videoTitle = "Going on a Lion Hunt"
        video1.videoDescription = "We've updated the song so that our lion 'hunt' is a very lovely video about trying to take a photo of a lion. We at LittleBabyBum say 'NO' to all forms of animal cruelty!"
        
        // append it into the videos array
        videos.append(video1)
        
        
        // create a video object
        let video2 = Video()
        
        // assign properties
        video2.videoId = "cdvDMpIUMpo"
        video2.videoTitle = "Clap Your Hands Song"
        video2.videoDescription = "Mai and John-John Clap Hands Song."
        
        // append it into the videos array
        videos.append(video2)
        
        
        // create a video object
        let video3 = Video()
        
        // assign properties
        video3.videoId = "BHcFQ9gaMF4"
        video3.videoTitle = "Sleeping Bunnies"
        video3.videoDescription = "Cute Bunnies sleeping till noon... Dad's favorite."
        
        // append it into the videos array
        videos.append(video3)


        // create a video object
        let video4 = Video()
        
        // assign properties
        video4.videoId = "axPmoijvWKM"
        video4.videoTitle = "Ants go Marching"
        video4.videoDescription = "Red ants are scared of the rain!"
        
        // append it into the videos array
        videos.append(video4)
        
        
        // create a video object
        let video5 = Video()
        
        // assign properties
        video5.videoId = "izjXKA7CSbg"
        video5.videoTitle = "Ten Little Dinosaurs"
        video5.videoDescription = "Ten cute and funky dinosaurs like to swim."
        
        // append it into the videos array
        videos.append(video5)
        
        
        // return the array to the caller
        return videos
    }
    
}
