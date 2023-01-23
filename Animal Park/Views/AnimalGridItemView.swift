//
//  AnimalGridItemView.swift
//  Animal Park
//
//  Created by Amish Tufail on 23/01/2023.
//

import SwiftUI

struct AnimalGridItemView: View {
    let animal: Animal
    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .clipShape(
                RoundedRectangle(cornerRadius: 12.0, style: .continuous)
            )
    }
}

struct AnimalGridItemView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        AnimalGridItemView(animal: animals[1])
            .previewLayout(.sizeThatFits)
    }
}
