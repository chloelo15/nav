//
//  BlogViewController.swift
//  CH-final
//
//  Created by Chloe Lo on 5/2/19.
//  Copyright © 2019 Chloe Lo. All rights reserved.
//

import UIKit

class BlogViewController: UIViewController {

    var imageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var fav1Label: UILabel!
    @IBOutlet weak var fav2Label: UILabel!
    @IBOutlet weak var fav3Label: UILabel!
    @IBOutlet weak var moreLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    var name: String!
    var city: String!
    var country: String!
    var fav1: String!
    var fav2: String!
    var fav3: String!
    var more: String!
    var date: String!
    var tripTitle: String!
    
    override func viewDidLoad() {        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        cityLabel.text = city
        countryLabel.text = country
        nameLabel.text = name
        dateLabel.text = date
        fav1Label.text = "1. " + fav1
        fav2Label.text = "2. " + fav2
        fav3Label.text = "3. " + fav3
        moreLabel.text = more
        titleLabel.text = tripTitle
    
        
        let image = UIImage(named: "lake.jpg")!
        self.imageView = UIImageView(frame: UIScreen.main.bounds)
        self.imageView.contentMode = .scaleAspectFill
        self.imageView.image = image
        self.imageView.alpha = 0.5
        self.view.insertSubview(imageView, at: 0)
        
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
