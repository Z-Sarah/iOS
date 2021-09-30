//
//  RestaurantDetailViewController.swift
//  Yelpy
//
//  Created by Sarah Zheng on 9/23/21.
//  Copyright © 2021 memo. All rights reserved.
//

import UIKit
import AlamofireImage

class RestaurantDetailViewController: UIViewController {

    @IBOutlet weak var restaurantImage: UIImageView!
    var r: Restaurant!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        restaurantImage.af.setImage(withURL: r.imageURL!)
    }

}
