//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by li on 2021/2/5.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool
    
    var body: some View {
        var h: String = "hello world!"
        return Text(h)
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
