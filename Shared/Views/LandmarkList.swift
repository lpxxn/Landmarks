//
//  LandmarkList.swift
//  Landmarks
//
//  Created by li on 2021/2/2.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }

    var body: some View {
        // 继承 Identifiable后就可以不这么用了
        //List (landmarks, id: \.id) { landmark in
        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly, label: {
                    Text("Favorites only")
                })
                
                ForEach(filteredLandmarks) {landmark in
                    NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                        VStack {
                            LandmarkRow(landmark: landmark).tag(landmark)
                            //Divider()
                        }
                    }
                }
            }
            .frame(minWidth: 200)
            .navigationTitle("Landmarks")

        }

    }
}
/*
 https://medium.com/better-programming/using-sidebar-in-swiftui-without-a-navigationview-94f4181c09b
 */

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
        // 多个端同时测试
//        ForEach(["iPhone 11", "iPhone SE"], id: \.self) { deviceName in
//            LandmarkList()
//                .previewDevice(PreviewDevice(rawValue: deviceName))
//                .previewDisplayName(deviceName)
//        }
    }
}
