//
//  ViewController.swift
//  TimerApp
//
//  Created by トム・クルーズ on 2023/07/01.
//

import UIKit

class ViewController: UIViewController {
    
    // タイマーの変数を作成
    var timer: Timer?
    // カウント（経過時間）の変数を作成
    var count = 0
    // 設定値を扱うキーを設定
    let settingKey = "timer_value"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // UserDefaultsのインスタンス生成
        let settings = UserDefaults.standard
        // UserDefaultsに初期値を登録
        settings.register(defaults: [settingKey: 10])
    }

    @IBOutlet weak var countDownLabel: UILabel!
    
    @IBAction func settingButtonAction(_ sender: Any) {
    }
    
    @IBAction func startButtonAction(_ sender: Any) {
    }
    
    @IBAction func stopButtonAction(_ sender: Any) {
    }
    
    // 画面を更新する（戻り値：remainCount：残り時間）
    func displayUpdate() -> Int {
        // UserDefaultsのインスタンス生成
        let setting = UserDefaults.standard
        // 取得した秒数をtimerValueに渡す
        let timerValue = setting.integer(forKey: settingKey)
        // 残り時間（remainCount）を生成
        let remainCount = timerValue - count
        // remainCount（残り時間）をラベルに表示
        countDownLabel.text = "残り\(remainCount)秒"
        // 残り時間を戻り値に設定
        return remainCount
    }
}

