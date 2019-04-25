//
//  KVCSimple.swift
//  KVO&KVC&DependencySimple
//
//  Created by mac on 4/24/19.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation

class User: NSObject {
    @objc private var name = String()
    var age = 0
    private(set) var test: Bool = true
    
    func getName() -> String {
        return name
    }
}

//func Test() {
//    let user = User()
//    user.setValue("Constantine", forKey: "name")
//
//    //user.setValue("Constantine", forKey: #keyPath(User.name))
//
//    print(user.name)
//}

