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

class ViewController2: UIViewController {
    
    private let engine = AVAudioEngine()
    private let player = AVAudioPlayerNode()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
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
                completionHandler: {
                    print("player completion")
            })
            
            engine.prepare()
            try engine.start()
            
        } catch {
            fatalError("can't find the audio file.")
        }
        
    }

    @objc func play() {
        player.play()
    }
    
    @objc func pause() {
        player.pause()
    }
    
    @objc func stop() {
        player.stop()
    }
    

}
