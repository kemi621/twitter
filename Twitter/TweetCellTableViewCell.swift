//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by user168675 on 4/26/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tweetContent: UILabel!
    
    @IBOutlet weak var faveButton: UIButton!
    
    @IBOutlet weak var retweetButton: UIButton!
    
    var favorited:Bool = false
    var tweetId:Int = -1

    @IBAction func favoriteTweet(_ sender: Any) {
        let toBeFavorited = !favorited
        if(toBeFavorited){
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {self.setFavorited(true)}, failure: {(error) in print("Favorite did not succeed: \(error)")})
        }
        else{
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId, success: {self.setFavorited(false)}, failure: {(error) in print("Unfavorite did not succeed: \(error)")})
        }
    }
    
    @IBAction func retweet(_ sender: Any) {
    }
    
    
    func setFavorited(_ isFavorited:Bool){
        favorited = isFavorited
        if(favorited){
            faveButton.setImage(UIImage(named:"favor-icon-red"), for: UIControl.State.normal)
        }
        else{
            faveButton.setImage(UIImage(named:"favor-icon-2"), for: UIControl.State.normal)        }
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
