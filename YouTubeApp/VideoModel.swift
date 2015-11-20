//
//  VideoModel.swift
//  YouTubeApp
//
//  Created by doug harper on 11/20/15.
//  Copyright © 2015 Doug Harper. All rights reserved.
//

import UIKit

class VideoModel: NSObject {

    func getVideos() -> [Video] {
        
        // create an empty array of video objects
        var videos = [Video]()
        
        // create a video object 
        let video1 = Video()
        
        // assign properties
        video1.videoId = "9gZ9x0cgQA"
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
