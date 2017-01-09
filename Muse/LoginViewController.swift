//
//  LoginViewController.swift
//  Output
//
//  Created by Admin on 11/1/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit
import AVFoundation
import Firebase


class LoginViewController: UIViewController {
    @IBOutlet weak var appLogo: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var learnMore: UIButton!
    var player: AVPlayer?
    var window: UIWindow?

    override func viewWillAppear(_ animated: Bool) {
        
        loadPlayer()

    }
    
    func loadPlayer(){
        let path = Bundle.main.path(forResource: "MUSELogin", ofType: "mp4")
        let player = AVPlayer(url: NSURL(fileURLWithPath: path!) as URL)
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.view.frame
        playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        self.view.layer.addSublayer(playerLayer)
        player.seek(to: kCMTimeZero)
        player.play()
        
        NotificationCenter.default.addObserver(self, selector: #selector(LoginViewController.playerItemDidReachEnd(notification:)), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: player.currentItem)
        
        self.view.addSubview(appLogo)
        //self.view.addSubview(descriptionLabel)
        self.view.addSubview(learnMore)
        
    }
    func playerItemDidReachEnd(notification: NSNotification) {

        if let playerItem: AVPlayerItem = notification.object as? AVPlayerItem {
            playerItem.seek(to: kCMTimeZero)
            loadPlayer()
        }
    }
    
    @IBAction func learnMore(_ sender: Any) {
        
         let vc = SVMenuOptionManager.sharedInstance.slidingPanel
         self.present(vc, animated: true, completion: nil)
        

    }
    override func viewDidLoad() {
        super.viewDidLoad()


        UIView.animate(withDuration: 1.5, delay: 2.0, options: [], animations: {
            self.learnMore.alpha = 1.0
            }, completion: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
