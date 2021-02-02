//
//  LandmarkList.swift
//  Landmarks
//
//  Created by li on 2021/2/2.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        // 继承 Identifiable后就可以不这么用了
        //List (landmarks, id: \.id) { landmark in
        List(landmarks) { landmark in
            LandmarkRow(landmark: landmark)
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
