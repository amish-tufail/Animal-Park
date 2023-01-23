//
//  GalleryView.swift
//  Animal Park
//
//  Created by Amish Tufail on 23/01/2023.
//

import SwiftUI

struct GalleryView: View {
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    @State private var selectedAnimal: String = "lion"
    // Basic Grid
    // let gridLayout: [GridItem] = [
    //     GridItem(.flexible()),
    //     GridItem(.flexible()),
    //     GridItem(.flexible())
    // Effiect Grid
    // let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    // Dynamic Grid Layout
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Double = 3.0
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
    }
                                                
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .center, spacing: 30.0) {
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(.white, lineWidth: 8.0)
                    )
                Slider(value: $gridColumn, in: 2...4, step: 1)
                    .padding(.horizontal)
                    .onChange(of: gridColumn) { _ in
                        withAnimation(.easeIn) {
                            gridSwitch()
                        }
                    }
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10.0) {
                    ForEach(animals) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(
                                Circle()
                                    .stroke(.white, lineWidth: 1.0)
                            )
                            .onTapGesture {
                                withAnimation {
                                    selectedAnimal = item.image
                                    hapticImpact.impactOccurred()
                                }
                            }
                    }
                }
//                .animation(.easeIn, value: gridColumn)
                .onAppear {
                    gridSwitch()
                }
            }
            .padding(.horizontal, 10.0)
            .padding(.vertical, 50.0)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
