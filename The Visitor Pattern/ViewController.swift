//
//  ViewController.swift
//  The Visitor Pattern
//
//  Created by Quinton Quaye on 7/21/19.
//  Copyright © 2019 Quinton Quaye. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    let visitor = LoggerVisitor()
    let thankingVisitor = ThankYouVisitor()
    var listedContributors = [
        Contribution(date: Date(), author: "Contributor", email: "MyEmail@ME.com",  details: ""),
        Contribution(date: Date(), author: "OtherContributor", email: "MyOtherEmail@ME.com",  details: "")
    ]
    
    var thankedContributors = [
        Contribution(date: threeDaysAgo, author: "Michael Thomson", email: "MichaelThomson@MT.com", details: "Thank you Buddy!!"),
        Contribution(date: fourDaysAgo, author: "Andy Garcia", email: "AndyGarcia@AG.com", details: "Thanks again!!")
    ]
    
    var allContributions: [Contribution] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // let the Visitable arrayed Objects accept Visitors
        listedContributors.accept(visitor: visitor)
        //thankedContributors.accept(visitor: thankingVisitor)
        
        for i in listedContributors{
            allContributions.append(i)
            
        }
        for i in thankedContributors{
            allContributions.append(i)
        }
        for i in allContributions{
            print("name: \(i.author), DateContributed: \(i.date)")
        }
        print(allContributions)
        
        allContributions.accept(visitor: thankingVisitor)
        
        for contributor in thankingVisitor.contributions{
            contributor.sendThanks(contributor: contributor)
        }
    }
}

