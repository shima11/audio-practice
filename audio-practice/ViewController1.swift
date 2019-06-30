//
//  ViewController.swift
//  audio-practice
//
//  Created by jinsei_shima on 2019/06/30.
//  Copyright © 2019 jinsei_shima. All rights reserved.
//

// for app
// https://github.com/potato04/AudioSpectrum
// https://github.com/teodorpatras/Jukebox
// https://github.com/analogcode/Swift-Radio-Pro

// for analysis
// https://blog.ishotihadus.com/archives/373
// http://www2.odn.ne.jp/~cai00050/5.pdf

// Speech Recognition ios10*

import UIKit
import AVFoundation
import EasyPeasy

// AVAudioPlayer

class ViewController1: UIViewController {

    var audioPlayer: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Playing with AVAudioPlayer"

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
        stackView.alignment = .center

        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.value = 0.5
        slider.addTarget(self, action: #selector(slider(sender:)), for: .valueChanged)
        slider.easy.layout(Width(200))
        
        let vstackView = UIStackView(arrangedSubviews: [
            stackView,
            slider
            ])
        vstackView.axis = .vertical
        vstackView.spacing = 16
        vstackView.alignment = .center
        
        view.addSubview(vstackView)
        
        vstackView.easy.layout(
            Center()
        )

        playButton.addTarget(self, action: #selector(play), for: .touchUpInside)
        pauseButton.addTarget(self, action: #selector(pause), for: .touchUpInside)
        stopButton.addTarget(self, action: #selector(stop), for: .touchUpInside)

    }
    
    var isAudioFinished: Bool = true
    
    @objc func slider(sender: UISlider) {
        audioPlayer?.setVolume(sender.value, fadeDuration: 1)
    }
    
    @objc func play() {

        if isAudioFinished {
            let url = Bundle.main.url(forResource: "ohayo01", withExtension: "mp3")
            audioPlayer = try? AVAudioPlayer(contentsOf: url!)
            audioPlayer?.play()
            audioPlayer?.delegate = self
            isAudioFinished = true
        } else {
            audioPlayer?.play()
        }
    }
    
    @objc func pause() {
        audioPlayer?.pause()
    }
    
    @objc func stop() {
        audioPlayer?.stop()
    }
    

}

extension ViewController1: AVAudioPlayerDelegate {
    
    /* audioPlayerDidFinishPlaying:successfully: is called when a sound has finished playing. This method is NOT called if the player is stopped due to an interruption. */
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        print(#function, #dsohandle)
        isAudioFinished = false
    }
    
    /* if an error occurs while decoding it will be reported to the delegate. */
    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?) {
        print(#function, #dsohandle)
    }
    
    /* AVAudioPlayer INTERRUPTION NOTIFICATIONS ARE DEPRECATED - Use AVAudioSession instead. */
    
    /* audioPlayerBeginInterruption: is called when the audio session has been interrupted while the player was playing. The player will have been paused. */
    func audioPlayerBeginInterruption(_ player: AVAudioPlayer) {
        print(#function, #dsohandle)
    }
    
    /* audioPlayerEndInterruption:withOptions: is called when the audio session interruption has ended and this player had been interrupted while playing. */
    /* Currently the only flag is AVAudioSessionInterruptionFlags_ShouldResume. */
    func audioPlayerEndInterruption(_ player: AVAudioPlayer, withOptions flags: Int) {
        print(#function, #dsohandle)
    }
}
