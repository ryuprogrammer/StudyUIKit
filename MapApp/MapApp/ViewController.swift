//
//  ViewController.swift
//  MapApp
//
//  Created by トム・クルーズ on 2023/07/01.
//

import UIKit
import MapKit

class ViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Text Fieldのdelegate通知先を設定
        inputText.delegate = self
    }

    @IBOutlet weak var inputText: UITextField!
    
    @IBOutlet weak var dispMap: MKMapView!
    
    // TextFieldの入力完了したら通知を受け取る
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // キーボードを閉じる
        textField.resignFirstResponder()
        
        // 入力された文字を取り出す
        if let searchKey = textField.text {
            print(searchKey)
            
            // CLGeocoderを取得
            let geocoder = CLGeocoder()
            
            // 入力された文字から位置情報を取得
            geocoder.geocodeAddressString(searchKey) { placemarks, error in
                // 位置情報が存在する場合は、unwrapPlacemarksに取り出す
                guard let unwrapPlacemarks = placemarks else { return }
                
                // １件目の情報を取り出す
                guard let firstPlacemark = unwrapPlacemarks.first else { return }
                
                // 位置情報を取り出す
                guard let location = firstPlacemark.location else { return }
                
                // 位置情報から緯度経度をtargetCoordinateに取り出す
                let targetCoordinate = location.coordinate
                
                print(targetCoordinate)
                
                // MKPointAnnotationインスタンスを取得し、ピンを生成
                let pin = MKPointAnnotation()
                
                // ピンを置く場所に緯度経度を設定
                pin.title = searchKey
                
                // ピンを地図に緯度経度を設定
                self.dispMap.addAnnotation(pin)
                
                // 緯度経度を中心にして半径500mの範囲を表示
                self.dispMap.region = MKCoordinateRegion(center: targetCoordinate, latitudinalMeters: 500.0, longitudinalMeters: 500.0)
            }
        }
        
        // デフォルト動作を行うのでtrueを返す
        return true
    }
}

