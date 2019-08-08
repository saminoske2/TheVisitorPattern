//
//  ThankYouNotes.swift
//  The Visitor Pattern
//
//  Created by Quinton Quaye on 7/21/19.
//  Copyright © 2019 Quinton Quaye. All rights reserved.
//

import Foundation

struct Contribution{
    let date: Date
    let author: String
    let email: String
    let details: String
}

// make those contribution objects Visitable so we can use Visitors on them:

extension Contribution: Visitable{
    //do something
    func sendThanks(contributor: Contribution){
        print("Thank you for your support \(contributor.author)!")
    }
}

// the contributions will be Visitable, since we also made Array: Visitable, all items in an array will be visitable too.



//make a logger a Visitor
class LoggerVisitor: Visitor{
    func visit<T>(element: T) where T : Visitable {
        guard let contribution = element as? Contribution else{
            return
        }
        print("\(contribution.author) /\(contribution.email)")
    }
}


let threeDaysAgo = Calendar.current.date(byAdding: .day, value: -3, to: Date())!
let fourDaysAgo = Calendar.current.date(byAdding: .day, value: -4, to: Date())!

class ThankYouVisitor: Visitor{
    var contributions = [Contribution]()
    
    func visit<T>(element: T) where T : Visitable {
        guard let contribution = element as? Contribution else{
            return
        }
        
        // check that the contribution was done btween 3 & 4 days ago
        if contribution.date <= threeDaysAgo && contribution.date >= fourDaysAgo{
            contributions.append(contribution)
        }
        print("\(contribution.author) /\(contribution.email)")
        print("contributions amount: \(contributions.count)")
    }
    
    
}

  
