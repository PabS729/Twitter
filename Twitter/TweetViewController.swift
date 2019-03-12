//
//  TweetViewController.swift
//  Twitter
//
//  Created by Minjing Shi on 3/5/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController {

    @IBOutlet weak var tweetText: UITextView!
    @IBAction func Tweet(_ sender: Any) {
        if (!tweetText.text.isEmpty) {
            TwitterAPICaller.client?.postTweet(tweetString: tweetText.text, success: {
                self.dismiss(animated: true, completion: nil)
            }, failure: { (error) in
                print("Error posting tweets\(error)")
                self.dismiss(animated: true, completion: nil)
            })
        }
        else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    @IBAction func cancelTweet(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tweetText.becomeFirstResponder()
        // Do any additional setup after loading the view.
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
