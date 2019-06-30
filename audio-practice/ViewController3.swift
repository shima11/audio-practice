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

class ViewController3: UIViewController {
    
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
        
        
    }
    
    @objc func play() {
    
    }
    
    @objc func pause() {
        
    }
    
    @objc func stop() {
        
    }
    
    
}
