//
//  SettingViewController.swift
//  TimerApp
//
//  Created by トム・クルーズ on 2023/07/02.
//

import UIKit

class SettingViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    // UIPickerViewに表示するデータをArrayで作成
    let settingArray: [Int] = [10, 20, 30, 40, 50, 60]
    // 設定値を覚えるキーを設定
    let settingKey = "timer_value"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // timerSettingPickerのデリゲートとデータソースの通知先を指定
        timerSettingPicker.delegate = self
        timerSettingPicker.dataSource = self
        
        // UserDefaultsの取得
        let setting = UserDefaults.standard
        let timerValue = setting.integer(forKey: settingKey)
        
        // Pickerの選択を合わせる
        for row in 0..<settingArray.count {
            if settingArray[row] == timerValue {
                timerSettingPicker.selectRow(row, inComponent: 0, animated: true)
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBOutlet weak var timerSettingPicker: UIPickerView!
    
    @IBAction func decsionButtonAction(_ sender: Any) {
        // UserDefaultに保存される
    }
}
