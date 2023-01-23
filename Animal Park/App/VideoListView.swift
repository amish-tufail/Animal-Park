//
//  VideoListView.swift
//  Animal Park
//
//  Created by Amish Tufail on 23/01/2023.
//

import SwiftUI

struct VideoListView: View {
    @State var videos: [Video] = Bundle.main.decode("videos.json")
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    var body: some View {
        NavigationView {
            List {
                ForEach(videos) { item in
                    NavigationLink {
                        VideoPlayerView(videoSelected: item.id, videoTitle: item.name)
                    } label: {
                        VideoListItemView(video: item)
                            .padding(.vertical, 8.0)
                    }
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Videos")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    Button {
                        videos = videos.shuffled()
                        hapticImpact.impactOccurred()
                    } label: {
                        Image(systemName: "arrow.2.squarepath")
                    }
                }
            }
        }
    }
}

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
