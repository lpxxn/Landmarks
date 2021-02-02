//
//  LandmarkList.swift
//  Landmarks
//
//  Created by li on 2021/2/2.
//

import SwiftUI

struct LandmarkList: View {
    //@State var selectedItem: Int?
    @State var selectedItem: Landmark?

    var body: some View {
        // 继承 Identifiable后就可以不这么用了
        //List (landmarks, id: \.id) { landmark in
        NavigationView {
            List(landmarks, id: \.self, selection: $selectedItem){ landmark in
                NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                    VStack {
                        LandmarkRow(landmark: landmark).tag(landmark)
                        Divider()
                    }
                }
            }
            .frame(minWidth: 200)
            .navigationTitle("Landmarks")
            .onAppear {
                self.selectedItem = landmarks[0]
            }
            /*
            List(landmarks) { landmark in
                //NavigationLink(destination: LandmarkDetail(), tag:landmark.id, selection: self.$selection) {
                NavigationLink(destination: LandmarkDetail()) {
                    LandmarkRow(landmark: landmark).tag(landmark)
                }
            }
            .frame(minWidth: 200)
            .navigationTitle("Landmarks")
            .onAppear {
                //self.selection = 0
            }
             

            */
            detailView
            
        }

    }
    @ViewBuilder var detailView: some View {
        if selectedItem != nil {
            LandmarkDetail(landmark: selectedItem!)
            //LandmarkDetail(landmark: landmarks[selectedItem!])
        } else {
            LandmarkDetail(landmark: landmarks[0])
        }
    }
}
/*
 https://medium.com/better-programming/using-sidebar-in-swiftui-without-a-navigationview-94f4181c09b
 */

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
        // 多个端同时测试
//        ForEach(["iPhone 11", "iPhone SE"], id: \.self) { deviceName in
//            LandmarkList()
//                .previewDevice(PreviewDevice(rawValue: deviceName))
//                .previewDisplayName(deviceName)
//        }
    }
}