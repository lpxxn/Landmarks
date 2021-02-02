//
//  CircleImage.swift
//  Landmarks
//
//  Created by li on 2021/2/1.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    
    var body: some View {
        //Image("turtlerock")
        image
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("turtlerock"))
    }
}
