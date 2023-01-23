//
//  VideoListItem.swift
//  Animal Park
//
//  Created by Amish Tufail on 23/01/2023.
//

import SwiftUI

struct VideoListItemView: View {
    let video: Video
    var body: some View {
        HStack(spacing: 10.0) {
            ZStack {
                Image(video.thumbnail)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80.0)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 9.0, style: .continuous)
                )
                Image(systemName: "play.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32.0, height: 32.0)
                    .shadow(radius: 4.0)
            }
            VStack(alignment: .leading, spacing: 10.0) {
                Text(video.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                Text(video.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            }
        }
    }
}

struct VideoListItem_Previews: PreviewProvider {
    static let videos: [Video] = Bundle.main.decode("videos.json")
    static var previews: some View {
        VideoListItemView(video: videos[1])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
