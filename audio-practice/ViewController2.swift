//
//  ViewController2.swift
//  audio-practice
//
//  Created by jinsei_shima on 2019/06/30.
//  Copyright © 2019 jinsei_shima. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController2: UIViewController {
    
    private let engine = AVAudioEngine()
    private let player = AVAudioPlayerNode()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let urls = Bundle.main.urls(forResourcesWithExtension: "mp3", subdirectory: nil)
        
        do {
            //            let audioFiles = try paths
            //                .map { URL(string: $0)! }
            //                .map { try AVAudioFile(forReading: $0) }
            let audioFiles = try urls?
                .compactMap { $0 }
                .map { try AVAudioFile(forReading: $0) }
            
            let audioFile = (audioFiles?.first)!
            player.stop()
            player.prepareForInterfaceBuilder()
            player.scheduleFile(
                audioFile,
                at: AVAudioTime.init(hostTime: 1),
                completionHandler: nil
            )
            player.play()
            
        } catch {
            fatalError("can't find the audio file.")
        }
        
    }
}
