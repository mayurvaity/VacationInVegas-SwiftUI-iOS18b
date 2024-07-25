//
//  ScrollImage.swift
//  VacationInVegas
//
//  Created by Mayur Vaity on 25/07/24.
//

import SwiftUI

struct ScrollImage: View {
    let image: ImageResource
    
    var body: some View {
        Image(image)
            .resizable()
            .scaledToFit()
            .clipShape(.rect(cornerRadius: 20))
        //scrollTransition - resizes image as per below specified modifiers when exiting the screen 
            .scrollTransition { content, phase in
                //content - this image
                //phase - where is this image on the screen
                //phase.isIdentity - means when image is in front & center of the screen then show everything
                content
                    .scaleEffect(phase.isIdentity ? 1 : 0.5)
                    .opacity(phase.isIdentity ? 1 : 0.5)
            }
    }
}

#Preview {
    ScrollImage(image: .luxor)
}
