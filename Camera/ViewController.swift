//
//  ViewController.swift
//  Camera
//
//  Created by 小池基文 on 2017/12/04.
//  Copyright © 2017年 小池基文. All rights reserved.
//

import UIKit

// protocolにUIImagePickerControllerDelegate,UINavigationControllerDelegateを定義
// UIImagePickerControllerDelegate : カメラ、写真アルバムから画像を取得する画面を操作するのに必要なメソッドの定義
// UINavigationControllerDelegate : 複数のビューコントローラを操作するのに必要なメソッドの定義

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    // カメラランチャー起動時
    @IBAction func launchCamera(_ sender: UIBarButtonItem) {
        // 画像の取得元種別(enum型)の定義
//        let camera = UIImagePickerControllerSourceType.camera
        // デバイスのカメラ機能(有無)判定
//        if UIImagePickerController.isSourceTypeAvailable(camera) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            // カメラ画像表示オブジェクト生成
            let picker = UIImagePickerController()
            picker.sourceType = .camera
            // delegeteプロパティにself(UIImagePickerControllerDelegateとUINavigationControllerDelegateを批准)
            picker.delegate = self
            // モーダル表示
            self.present(picker, animated: true, completion: {() -> Void in print("カメラが起動しました")})
        }
    }
    // 撮影完了時(自動呼び出し)
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // オリジナル画像の取得とキャスト(UIImage)
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        // Viewに画像の設定
        self.imageView.image = image
        // 画像のアルバム保存
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        // モーダル消去
        self.dismiss(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

