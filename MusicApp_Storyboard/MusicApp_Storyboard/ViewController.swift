//
//  ViewController.swift
//  MusicApp_Storyboard
//
//  Created by トム・クルーズ on 2023/06/29.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    // ギター音源データの読み込み
    let guitarPath = Bundle.main.bundleURL.appendingPathComponent("guitarSound")
    var guitarPlayer = AVAudioPlayer()
    // シンバル音源データの読み込み
    let cymbalPath = Bundle.main.bundleURL.appendingPathComponent("cymbalSound")
    var cymbalPlayer = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func guitar(_ sender: UIButton) {
        soundPlay(path: guitarPath, soundPlayer: &guitarPlayer)
    }
    
    @IBAction func cymbal(_ sender: UIButton) {
        soundPlay(path: cymbalPath, soundPlayer: &cymbalPlayer)
    }
    
    @IBAction func playSound(_ sender: UIButton) {
    }
    
    @IBAction func stopSound(_ sender: UIButton) {
    }
    
    func soundPlay(path: URL, soundPlayer:inout AVAudioPlayer) {
        do {
            soundPlayer = try AVAudioPlayer(contentsOf: path, fileTypeHint: nil)
            soundPlayer.stop()
            soundPlayer.currentTime = 0.0
            soundPlayer.play()
        } catch {
            print("えらー")
        }
    }
}
