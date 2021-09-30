//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Sarah Zheng on 9/21/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tweetContent: UILabel!
    @IBOutlet weak var retweetBotton: UIButton!
    @IBOutlet weak var favBotton: UIButton!
    
    var favorited: Bool = false
    var tweetId:Int = -1
    var retweeted:Bool = false
    
    @IBAction func favoriteTweet(_ sender: Any) {
        let toBeFavorited = !favorited
        if (toBeFavorited) {
            TwitterAPICaller.client?.favoriteTweet(tweetID: tweetId, success: {
                self.setFavorite(true)
            }, failure: { (error) in
                print("Favorite did not succeed: \(error)")
            })
        } else {
            TwitterAPICaller.client?.unfavoriteTweet(tweetID: tweetId, success: {
                self.setFavorite(false)
            }, failure: { (error) in
                print("Unfavorite did not succeed: \(error)")
            })
        }
    }
    
    @IBAction func retwwet(_ sender: Any) {
        TwitterAPICaller.client?.retweet(tweetId: tweetId, success: {
            self.setRetweeted(true)
        }, failure: { (error) in
            print("Error is retweetingL \(error)")
        })
    }
    
    func setRetweeted(_ isRetweeted:Bool){
        if (isRetweeted) {
            retweetBotton.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
            retweetBotton.isEnabled = false
        } else {
            retweetBotton.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
            retweetBotton.isEnabled = true
        }
        
    }
    
    func setFavorite(_ isFavorited:Bool){
        favorited = isFavorited
        if(favorited){
            favBotton.setImage(UIImage(named:"favor-icon-red"), for: UIControl.State.normal)
        } else {
            favBotton.setImage(UIImage(named:"favor-icon"), for: UIControl.State.normal)
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
