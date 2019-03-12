//
//  TweetCell.swift
//  Twitter
//
//  Created by Minjing Shi on 3/4/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {

    @IBOutlet weak var TimeLabel: UILabel!
    @IBOutlet weak var ProfilePic: UIImageView!
    @IBOutlet weak var TweetContent: UILabel!
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var retweetBut: UIButton!
    var favorited = false
    var tweetId = -1
    var retweeted = false
    @IBAction func retweet(_ sender: Any) {
        TwitterAPICaller.client?.reTweet(tweetId: tweetId, success: {
            self.setRetweeted(true)
        }, failure: { (Error) in
            print("error: \(Error)")
        })
    }
    @IBAction func Favorite(_ sender: Any) {
        let tbFavorited = !favorited
        if tbFavorited {
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                self.setFavorited(true)
            }, failure: { (error) in
                print("error! \(error)")
            })
        }
        else {
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId, success: {
                self.setFavorited(false)
            }, failure: { (error) in
                print("error! \(error)")
            })
        }
        
    }
   
    func setRetweeted (_ isretweeted:Bool){
        if isretweeted {
            retweetBut.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
            retweetBut.isEnabled = false
        }
        else {
            retweetBut.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
            retweetBut.isEnabled = true
        }
        
    }
    func setFavorited(_ isFavorited:Bool){
        favorited = isFavorited
        if favorited {
            favButton.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
        }
        else {
            favButton.setImage(UIImage(named: "favor-icon-1"), for: UIControl.State.normal)
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
