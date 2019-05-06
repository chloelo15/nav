//
//  PlacesTableViewController.swift
//  CH-final
//
//  Created by Chloe Lo on 4/17/19.
//  Copyright © 2019 Chloe Lo. All rights reserved.
//

import UIKit
import Firebase

class PlacesTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var placesTableView: UITableView!
    var blogdata: [String:[String:Any]] = [:]

    var imageView: UIImageView!
    
    override func viewDidLoad() {
//        addBlogPost(user: "Chloe", country: "USA", identifier: "chloe-la", blogPost: BlogPost(name: "Chloe", country: "USA", city: "Los Angeles"))
//        addBlogPost(user: "Helen", country: "USA", identifier: "helen-sf", blogPost: BlogPost(name: "Helen", country: "USA", city: "San Fransisco"))
//        addBlogPost(user: "Chloe", country: "Italy", identifier: "chloe-rome", blogPost: BlogPost(name: "Chloe", country: "Italy", city: "Rome"))

        super.viewDidLoad()
        placesTableView.delegate = self
        placesTableView.dataSource = self
        // Do any additional setup after loading the view.
        
        let image = UIImage(named: "lake.jpg")!
        self.imageView = UIImageView(frame: UIScreen.main.bounds)
        self.imageView.contentMode = .scaleAspectFill
        self.imageView.image = image
        self.imageView.alpha = 0.5
        self.view.insertSubview(imageView, at: 0)
    }

    override func viewDidAppear(_ animated: Bool) {
        var countries = [String]()
        db.collection("Country").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                let docs = querySnapshot!.documents
                for d in docs {
                    countries.append(d.documentID)
                    self.blogdata[d.documentID] = d.data()
                }
                self.placesTableView.reloadData()
            }
        }
        placesTableView.reloadData()
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return blogdata.keys.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Array(blogdata.keys)[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (Array(blogdata.values)[section] as AnyObject).count as Int
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "placesCell") as! PlacesTableViewCell
        
        let sectionTitle = Array(blogdata.keys)[indexPath.section]
        
        let rowUser = Array(blogdata[sectionTitle]!.keys)[indexPath.row]
        
        let cellData = NSArray(array: NSArray(object: blogdata[sectionTitle]![rowUser]!))[0] as! NSDictionary
        
        cell.placesLabel.text = cellData["city"] as? String
        
        cell.userLabel.text = cellData["user"] as? String
        
        return cell
        
    }
    

    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let country = Array(blogdata.keys)[indexPath.section]
        
        let id = Array(blogdata[country]!.keys)[indexPath.row]
        
        let cellData = NSArray(array: NSArray(object: blogdata[country]![id]!))[0] as? NSDictionary
        
        performSegue(withIdentifier: "viewBlogPost", sender: cellData)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let dest = segue.destination as? BlogViewController {
            if let data = sender as? NSDictionary {
                dest.name = data["user"] as? String
                dest.city = data["city"] as? String
                dest.country = data["country"] as? String
                dest.fav1 = data["fav1"] as? String
                dest.fav2 = data["fav2"] as? String
                dest.fav3 = data["fav3"] as? String
                dest.more = data["more"] as? String
                dest.date = data["date"] as? String
                dest.tripTitle = data["tripTitle"] as? String
            }
        }
        
        
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
}
