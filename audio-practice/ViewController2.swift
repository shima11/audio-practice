//
//  ViewController2.swift
//  audio-practice
//
//  Created by jinsei_shima on 2019/06/30.
//  Copyright © 2019 jinsei_shima. All rights reserved.
//

import UIKit
import AVFoundation
import EasyPeasy

// http://tiny-wing.hatenablog.com/entry/2016/05/31/123718
// https://qiita.com/shingohry/items/9cf67a5ec51102b42c01

class ViewController2: UIViewController {
    
    private let engine = AVAudioEngine()
    private let player = AVAudioPlayerNode()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        title = "Playing with AVAudioEngine"

        view.backgroundColor = .white
        
        let playButton = UIButton()
        playButton.setTitle("Play", for: .normal)
        playButton.setTitleColor(.darkText, for: .normal)
        playButton.sizeToFit()
        playButton.isUserInteractionEnabled = true
        
        let pauseButton = UIButton()
        pauseButton.setTitle("Pause", for: .normal)
        pauseButton.setTitleColor(.darkText, for: .normal)
        pauseButton.sizeToFit()
        pauseButton.isUserInteractionEnabled = true
        
        let stopButton = UIButton()
        stopButton.setTitle("Stop", for: .normal)
        stopButton.setTitleColor(.darkText, for: .normal)
        stopButton.sizeToFit()
        stopButton.isUserInteractionEnabled = true
        
        let stackView = UIStackView(arrangedSubviews: [
            playButton,
            pauseButton,
            stopButton
            ])
        stackView.axis = .horizontal
        stackView.spacing = 16
        view.addSubview(stackView)
        
        stackView.easy.layout(
            Center()
        )
        
        playButton.addTarget(self, action: #selector(play), for: .touchUpInside)
        pauseButton.addTarget(self, action: #selector(pause), for: .touchUpInside)
        stopButton.addTarget(self, action: #selector(stop), for: .touchUpInside)

        
        
        do {
            
            let urls = Bundle.main.urls(forResourcesWithExtension: "mp3", subdirectory: nil)

            let audioFiles = try urls?
                .compactMap { $0 }
                .map { try AVAudioFile(forReading: $0) }
            
            let audioFile = (audioFiles?.first)!
            
            engine.attach(player)
            
            engine.connect(player, to: engine.mainMixerNode, format: nil)
            
            player.scheduleFile(
                audioFile,
                at: nil,
                completionHandler: { [weak self] in
                    print("player completion")
                    self?.isAudioFinished = true
            })
            
            engine.prepare()
            try engine.start()
            
        } catch {
            fatalError("can't find the audio file.")
        }
        
    }

    var isAudioFinished: Bool = true

    @objc func play() {
        
//        if isAudioFinished {
//            player.stop()
//        }
        player.reset()
        player.play()
        
        isAudioFinished = false
    }
    
    @objc func pause() {
        player.pause()
    }
    
    @objc func stop() {
        player.stop()
    }
    

}
