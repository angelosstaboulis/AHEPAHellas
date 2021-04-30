//
//  History.swift
//  AHEPAHellas
//
//  Created by Angelos Staboulis on 25/09/2019.
//  Copyright © 2019 Angelos Staboulis. All rights reserved.
//

import UIKit
import AVKit
protocol VideoPlayerDelegate:AnyObject{
    func initHeader()
    func setupVideoPlayer()
}
class History: AVPlayerViewController {
    var video:AVPlayer!
    var videoOutput:AVPlayerLayer!
    var playVideoValue:Bool!=false
    var path:String!
    var url:URL!
    override func viewDidLoad() {
        setupVideoPlayer()
    }
}
extension History {
    func initHeader(){
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Play Video", style: .plain, target: self, action: #selector(playVideo))
        self.title = "AHEPA History"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Επιστροφή", style: .plain, target: self, action: #selector(goBack))
        path = Bundle.main.path(forResource: "history", ofType: "mp4")
        url = URL(fileURLWithPath: path!)
    }
    func setupVideoPlayer(){
        initHeader()
        video = AVPlayer(url: url)
        self.player = video
        videoOutput = AVPlayerLayer(player: video)
        videoOutput.frame = view.frame
        view.layer.addSublayer(videoOutput)
    }
    @objc func goBack(){
        self.dismiss(animated:true, completion:nil)
    }
    @objc func playVideo(){
        if playVideoValue ==  true {
            self.navigationItem.rightBarButtonItem?.title = "Play Video"
            video.pause()
            playVideoValue = false
        }
        else{
            self.navigationItem.rightBarButtonItem?.title = "Stop Video"
            video.play()
            playVideoValue = true
        }
    }
}
