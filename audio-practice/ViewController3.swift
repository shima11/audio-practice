//
//  ViewController3.swift
//  audio-practice
//
//  Created by jinsei_shima on 2019/07/01.
//  Copyright © 2019 jinsei_shima. All rights reserved.
//

import UIKit
import AVFoundation
import EasyPeasy

// Voice recording

// https://github.com/algolia/voice-overlay-ios
// https://github.com/HassanElDesouky/VoiceMemosClone
// https://www.pebblewind.com/entry/2017/09/23/094603

class ViewController3: UIViewController {
    
    private let engine = AVAudioEngine()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        title = "Recording"

        view.backgroundColor = .white
                
        let playButton = UIButton()
        playButton.setTitle("Start", for: .normal)
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
            let dir = NSHomeDirectory()
            let url = URL(string: dir + "/hoge")
            let outputFile = try AVAudioFile(forWriting: url!, settings: [:])
            let input = engine.inputNode
            input.volume = 0
            input.installTap(onBus: 0, bufferSize: 4096, format: input.inputFormat(forBus: 0), block: { (buffer, when) in
                print(buffer, when)
                try! outputFile.write(from: buffer)
            })
            
        } catch {
            fatalError("can't find the audio file.")
        }
        
        
    }
    
    @objc func play() {
    
    }
    
    @objc func pause() {
        
    }
    
    @objc func stop() {
        
    }
    
    
}
