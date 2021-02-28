//
//  TrailClosure.swift
//  Landmarks
//
//  Created by li on 2021/2/28.
//

import Foundation
func test(txt: String, resolve: (_ name: String) -> Void) {
    resolve("Dodo")
}
func a() {
    test(txt: "hello", resolve: {(name: String) in
        print("callback")
    })
    
    test(txt: "hello", resolve: {
       print("callback: \($0)")
    })
    
    test(txt: "hello") {(name: String) in
        print("callback")
    }
    
    test(txt: "hello") {
       print("callback: \($0)")
    }
}


