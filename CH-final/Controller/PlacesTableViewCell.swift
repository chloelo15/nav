//
//  PlacesTableViewCell.swift
//  CH-final
//
//  Created by Chloe Lo on 4/17/19.
//  Copyright © 2019 Chloe Lo. All rights reserved.
//

import UIKit

class PlacesTableViewCell: UITableViewCell {

    
    @IBOutlet weak var placesLabel: UILabel!
    
    @IBOutlet weak var userLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
