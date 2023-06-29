//
//  ViewController.swift
//  StudyUIKit001
//
//  Created by トム・クルーズ on 2023/06/29.
//

import UIKit

class ViewController: UIViewController {
    // じゃんけんの手の種類
    enum JankenType: String {
        case gu = "ぐー"
        case choki = "ちょき"
        case pa = "ぱー"
    }
    
    // 出力するじゃんけんの手
    var showHand: JankenType = .gu

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var answerImageView: UIImageView!
    
    @IBOutlet weak var answerLavel: UILabel!
    
    // ジャンケンボタン
    @IBAction func shuffleAction(_ sender: Any) {
        // じゃんけんの手のテキストと画像
        let jankenResult = makeJanken()
        // テキストを更新
        answerLavel.text = jankenResult.type
        // 画像を更新
        answerImageView.image = UIImage(named: jankenResult.image)
    }
    
    // じゃんけんのメソッド
    func makeJanken() -> (type: String, image: String) {
        var jankenResult: JankenType = .gu
        // ランダムな数値を算出
        let randomNumber = Int.random(in: 0...2)
        
        // ランダムな数値とじゃんけんの結果を適用
        switch randomNumber {
        case 0: jankenResult = .gu
        case 1: jankenResult = .choki
        case 2: jankenResult = .pa
        default: jankenResult = .gu
        }
        
        // じゃんけんの結果を出力
        return (jankenResult.rawValue, "")
    }
}

