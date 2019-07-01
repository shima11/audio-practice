//
//  ViewController4.swift
//  audio-practice
//
//  Created by jinsei_shima on 2019/07/01.
//  Copyright © 2019 jinsei_shima. All rights reserved.
//

import UIKit
import AVFoundation
import EasyPeasy

// Speech Recognition

// http://www.cl9.info/entry/2018/01/14/184548

class ViewController4: UIViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        title = "Speech Recognition"
        
        view.backgroundColor = .white
        
        let playButton = UIButton()
        playButton.setTitle("Start", for: .normal)
        playButton.setTitleColor(.darkText, for: .normal)
        playButton.sizeToFit()
        playButton.isUserInteractionEnabled = true
        
        let stopButton = UIButton()
        stopButton.setTitle("Stop", for: .normal)
        stopButton.setTitleColor(.darkText, for: .normal)
        stopButton.sizeToFit()
        stopButton.isUserInteractionEnabled = true
        
        let stackView = UIStackView(arrangedSubviews: [
            playButton,
            stopButton
            ])
        stackView.axis = .horizontal
        stackView.spacing = 16
        view.addSubview(stackView)
        
        stackView.easy.layout(
            Center()
        )
        
        playButton.addTarget(self, action: #selector(play), for: .touchUpInside)
        stopButton.addTarget(self, action: #selector(stop), for: .touchUpInside)
        
        
    }
    
    @objc func play() {
        
    }
    
    @objc func stop() {
        
    }
    
    
}
