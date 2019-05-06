//
//  Data.swift
//  CH-final
//
//  Created by Chloe Lo on 4/17/19.
//  Copyright © 2019 Chloe Lo. All rights reserved.
//

import Foundation
import Firebase

let db = Firestore.firestore()

//var countries: [String: [String]] = ["USA":["chloe-la", "helen-sf"], "Italy":["chloe-rome"]]
//var users: [String: [String]] = ["Chloe":["chloe-la", "chloe-rome"], "Helen":["helen-sf"]]
//var blogs: [String:BlogPost] = ["chloe-la": BlogPost(name: "Chloe", country: "USA", city: "Los Angeles"), "helen-sf": BlogPost(name: "Helen", country: "USA", city: "San Fransisco"), "chloe-rome": BlogPost(name: "Chloe", country: "Italy", city: "Rome")]

func addBlogPost(user: String, country: String, identifier: String, blogPost: BlogPost) {
    db.collection("Country").document(country).setData([
        identifier: [
            "user": blogPost.user!,
            "country": blogPost.country!,
            "city": blogPost.city!,
            "fav1": blogPost.fav1!,
            "fav2": blogPost.fav2!,
            "fav3": blogPost.fav3!,
            "more": blogPost.more!,
            "date": blogPost.date!,
            "tripTitle": blogPost.tripTitle!
        ]
    ], merge: true) { err in
        if let err = err {
            print("Error writting document: \(err)")
        } else {
            print("Document successfully written.")
        }
    }

//    db.collection("User").document(user).setData([
//        identifier: identifier
//    ], merge: true) { err in
//        if let err = err {
//            print("Error writting document: \(err)")
//        } else {
//            print("Document successfully written.")
//        }
//    }
//
//    db.collection("Blog").document(identifier).setData([
//        "user": blogPost.user!,
//        "country": blogPost.country!,
//        "city": blogPost.city!
//    ], merge: true) { err in
//        if let err = err {
//            print("Error writting document: \(err)")
//        } else {
//            print("Document successfully written.")
//        }
//    }
}

//func addBlogPost(user: String, country: String, identifier: String, blogPost: BlogPost) {
//    if countries[country] == nil {
//        countries[country] = [identifier]
//    } else {
//        countries[country]?.append(identifier)
//    }
//
//    if users[user] == nil {
//        users[user] = [identifier]
//    } else {
//        users[user]?.append(identifier)
//    }
//
//    blogs[identifier] = blogPost
//}


