//
//  videoplayViewController.swift
//  speech recognition
//
//  Created by Admin on 07/11/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit
class videoplayViewController: UIViewController {

    @IBOutlet weak var view1: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let videoURL = URL(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
        let player = AVPlayer(url: videoURL!)
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.view1.bounds
        
        self.view1.layer.addSublayer(playerLayer)
        player.play()
        // Do any additional setup after loading the view.
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
