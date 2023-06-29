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
    
    // じゃけんの結果を表示
    @IBOutlet weak var jankenResult: UILabel!
    
    @IBAction func jankenButton(_ sender: UIButton) {
        jankenResult.text = makeJanken().rawValue
    }
    // じゃんけんのメソッド
    func makeJanken() -> JankenType {
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
        return jankenResult
    }
}

