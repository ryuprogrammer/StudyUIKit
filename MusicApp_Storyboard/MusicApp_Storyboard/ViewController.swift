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
    let guitarData = NSDataAsset(name: "guitarSound")!.data
    // ギター用プレーヤーの変数
    var soundPlayer: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func guitar(_ sender: UIButton) {
        soundPlay(data: guitarData)
    }
    
    @IBAction func cymbal(_ sender: UIButton) {
    }
    
    @IBAction func playSound(_ sender: UIButton) {
    }
    
    @IBAction func stopSound(_ sender: UIButton) {
    }
    
    func soundPlay(data: Data) {
        do {
            soundPlayer = try AVAudioPlayer(data: data)
            soundPlayer.play()
        } catch {
            print("プレーヤーでエラー")
        }
    }
    
//    // 共通のプレーヤー再生処理
//    fileprivate func soundPlayer(player:inout AVAudioPlayer, path: URL, count: Int) {
//        do {
//            player = try AVAudioPlayer(contentsOf: path, fileTypeHint: nil)
//            player.numberOfLoops = count
//            player.play()
//        } catch {
//            print("player is error: \(error)")
//        }
//    }
}
