//
//  SecondViewController.swift
//  MoviePlayer
//
//  Created by 張翔 on 2020/02/06.
//  Copyright © 2020 張翔. All rights reserved.
//

import UIKit
import AVFoundation

class SecondViewController: UIViewController {
    
    @IBOutlet var playerView: PlayerView!
    var player: AVPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let moviePath = Bundle.main.path(forResource: "movie", ofType: "mov")!
        let movieURL = URL(fileURLWithPath: moviePath)
        
        player = AVPlayer(url: movieURL)
        playerView.player = player
        
        NotificationCenter.default.addObserver(self, selector: #selector(videoFinished), name: .AVPlayerItemDidPlayToEndTime, object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        player.play()
    }
    
    @objc func videoFinished() {
        performSegue(withIdentifier: "toThird", sender: nil)
    }
}
