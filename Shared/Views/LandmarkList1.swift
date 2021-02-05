//
//  LandmarkList1.swift
//  Landmarks
//
//  Created by li on 2021/2/5.
//

import SwiftUI

struct LandmarkList1: View {
    
    @State var selectedItem: Landmark?

    var landmarks = ModelData().landmarks

    var body: some View {
        // 继承 Identifiable后就可以不这么用了
        //List (landmarks, id: \.id) { landmark in
        NavigationView {
            //List(landmarks, id: \.self, selection: $selectedItem){ landmark in
            List(landmarks, id: \.self, selection: $selectedItem){ landmark in

                NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                    VStack {
                        LandmarkRow(landmark: landmark).tag(landmark)
                        //Divider()
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
            //detailView
//            if self.selectedItem != nil {
//                LandmarkDetail(landmark: selectedItem!)
//            } else {
//                LandmarkDetail(landmark: landmarks[0])
//            }

        }

    }
    var detailView: some View {
        if selectedItem != nil {
            print("bbbb")
            return  LandmarkDetail(landmark: selectedItem!)
            //LandmarkDetail(landmark: landmarks[selectedItem!])
        }
        print("aaa")
        //self.selectedItem = landmarks[0]
        return LandmarkDetail(landmark: landmarks[0])
        
    }
}
/*
 https://medium.com/better-programming/using-sidebar-in-swiftui-without-a-navigationview-94f4181c09b
 */

struct LandmarkList1_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList1()
        // 多个端同时测试
//        ForEach(["iPhone 11", "iPhone SE"], id: \.self) { deviceName in
//            LandmarkList()
//                .previewDevice(PreviewDevice(rawValue: deviceName))
//                .previewDisplayName(deviceName)
//        }
    }
}


