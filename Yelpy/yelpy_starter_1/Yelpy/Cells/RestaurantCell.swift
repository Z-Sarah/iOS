//
//  RestaurantCell.swift
//  Yelpy
//
//  Created by Sarah Zheng on 9/12/21.
//  Copyright © 2021 memo. All rights reserved.
//

import UIKit

class RestaurantCell: UITableViewCell {

    @IBOutlet weak var restaurantNameLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var starsImage: UIImageView!
    @IBOutlet weak var reviews: UILabel!
    @IBOutlet weak var restaurantImage: UIImageView!
    
    var r: Restaurant! {
        didSet {
            restaurantNameLabel.text = r.name
            categoryLabel.text = r.mainCategory
            phoneLabel.text = r.phone
            reviews.text = String(r.reviews) + " reviews"
            
            starsImage.image = Stars.dict[r.rating]!
            restaurantImage.af.setImage(withURL: r.imageURL!)
            restaurantImage.layer.cornerRadius = 10
            restaurantImage.clipsToBounds = true
        }
    }
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
