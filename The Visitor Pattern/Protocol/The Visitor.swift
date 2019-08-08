//
//  The Visitor.swift
//  The Visitor Pattern
//
//  Created by Quinton Quaye on 7/21/19.
//  Copyright © 2019 Quinton Quaye. All rights reserved.
//

import Foundation

protocol Visitor{
    func visit<T>(element: T) where T: Visitable
    //An object that can visit any object with the type: Visitable.
}

protocol Visitable {
    func accept(visitor: Visitor)//an object that is visitable by a visitor
}


// default implementation for our visitable nodes
extension Visitable{
    func accept(visitor: Visitor){
        //accept the visitor who is able to visit the visitable
        visitor.visit(element: self)
        
    }
}

//convenience on Array for visitables
extension Array: Visitable where Element: Visitable{
    //the array is now Visitable
    func accept(visitor: Visitor) {
        visitor.visit(element: self)
        for i in self{
            visitor.visit(element: i)
        }
        print()
    }
}
