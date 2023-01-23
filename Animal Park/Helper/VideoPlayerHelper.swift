//
//  VideoPlayerHelper.swift
//  Animal Park
//
//  Created by Amish Tufail on 23/01/2023.
//

import Foundation
import AVKit

var videoPlayer: AVPlayer? // Creating a Video Player

func playVideo(fileName: String, fileFormat: String) -> AVPlayer { // To play the video
    if Bundle.main.url(forResource: fileName, withExtension: fileFormat) != nil {
        videoPlayer = AVPlayer(url: Bundle.main.url(forResource: fileName, withExtension: fileFormat)!) // Video Player Created
        videoPlayer?.play() // To play the video automatically
    }
    return videoPlayer!
}


