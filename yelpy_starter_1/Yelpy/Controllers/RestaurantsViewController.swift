//
//  ViewController.swift
//  Yelpy
//
//  Created by Memo on 5/21/20.
//  Copyright © 2020 memo. All rights reserved.
//

import UIKit
import AlamofireImage
import Lottie
import SkeletonView

class RestaurantsViewController: UIViewController {
    
    // ––––– TODO: Add storyboard Items (i.e. tableView + Cell + configurations for Cell + cell outlets)
    // ––––– TODO: Next, place TableView outlet here
    var animationView: AnimationView?
    var refresh = true
    let yelpRefresh = UIRefreshControl()
    
    @IBOutlet weak var tableView: UITableView!
    
    // –––––– TODO: Initialize restaurantsArray
    var restaurantsArray: [Restaurant] = []
    
    // ––––– TODO: Add tableView datasource + delegate
    override func viewDidLoad() {
        super.viewDidLoad()
               
        tableView.visibleCells.forEach { $0.showSkeleton() }
        
        tableView.delegate = self
        tableView.dataSource = self
        getAPIData()
        tableView.rowHeight = 150
        
        yelpRefresh.addTarget(self, action: #selector(getAPIData), for: .valueChanged)
        tableView.refreshControl = yelpRefresh
        
        startAnimations()
    }
    
    // ––––– TODO: Get data from API helper and retrieve restaurants
    @objc func getAPIData() {
        API.getRestaurants() { (restaurants) in
            guard let restaurants = restaurants else {
                return
            }
            self.restaurantsArray = restaurants
            self.tableView.reloadData() // reload data!
            
            self.yelpRefresh.endRefreshing()
        }
    }
}

extension RestaurantsViewController: SkeletonTableViewDataSource {
    
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return "RestaurantCell"
    }
    
    func startAnimations() {
        view.isSkeletonable = true
        animationView = .init(name: "4762-food-carousel")
        animationView!.frame = CGRect(x: view.frame.width / 3, y: 156, width: 100, height: 100)
        animationView!.contentMode = .scaleAspectFit
        view.addSubview(animationView!)
        
        animationView!.loopMode = .loop
        animationView!.animationSpeed = 5
        animationView!.play()
    }
    
    @objc func stopAnimations() {
        animationView?.stop()
        view.subviews.last?.removeFromSuperview()
        view.hideSkeleton()
        refresh = false
    }
}
    
   
// ––––– TableView Functionality –––––
extension RestaurantsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // create restaurant cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell") as! RestaurantCell
        
        cell.r = restaurantsArray[indexPath.row]
        
        cell.showSkeleton()
        // Stop animation after like .5 seconds
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { (timer) in
            cell.stopSkeletonAnimation()
            cell.hideSkeleton()
        }
        
        return cell
    }

    // ––––– TODO: Create tableView Extension and TableView Functionality
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UITableViewCell
        if let indexPath = tableView.indexPath(for: cell) {
            let r = restaurantsArray[indexPath.row]
            let detailViewController = segue.destination as! RestaurantDetailViewController
            detailViewController.r = r
        }
    }
    
}
