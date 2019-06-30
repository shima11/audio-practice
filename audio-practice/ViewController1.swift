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

import UIKit
import AVFoundation

// AVAudioPlayer

class ViewController1: UIViewController {

    var audioPlayer: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // AVAudioPlayerで音声ファイルを再生する方法
        let url = Bundle.main.url(forResource: "ohayo01", withExtension: "mp3")
        audioPlayer = try? AVAudioPlayer(contentsOf: url!)
        audioPlayer?.setVolume(0.1, fadeDuration: 1)
        audioPlayer?.play()
        audioPlayer?.delegate = self

    }
    

    func demo_av_audio_player() {
    }

}

extension ViewController1: AVAudioPlayerDelegate {
    
    /* audioPlayerDidFinishPlaying:successfully: is called when a sound has finished playing. This method is NOT called if the player is stopped due to an interruption. */
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        print(#function, #dsohandle)
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
