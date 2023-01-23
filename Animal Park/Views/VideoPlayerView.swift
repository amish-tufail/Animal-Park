//
//  VideoPlayerView.swift
//  Animal Park
//
//  Created by Amish Tufail on 23/01/2023.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    var videoSelected: String
    var videoTitle: String
    var body: some View {
        VStack {
            VideoPlayer(player: playVideo(fileName: videoSelected, fileFormat: "mp4")) {
            }
            .overlay(
                Image("logo")
                    .resizable()
                    .frame(width: 32.0, height: 32.0)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    .padding(.horizontal, 8.0)
            )
        }
        .navigationTitle(videoTitle)
        .tint(.accentColor)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VideoPlayerView(videoSelected: "lion", videoTitle: "Lion")
        }
    }
}
