//
//  MemoViewController.swift
//  MemoPad
//
//  Created by 高山瑞基 on 2020/09/04.
//  Copyright © 2020 Takayama Mizuki. All rights reserved.
//

import UIKit

class MemoViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var contentTextView: UITextView!
    
    var saveData: UserDefaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()

        titleTextField.text = saveData.object(forKey: "title") as? String
        contentTextView.text = saveData.object(forKey: "content") as? String
        titleTextField.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveMemo(){
        //userDefaultに書き込み
        saveData.set(titleTextField.text, forKey: "title")
        saveData.set(contentTextView.text, forKey: "content")
        
        //alertを出す
        let alert: UIAlertController = UIAlertController(title: "保存", message: "メモの保存が完了しました", preferredStyle: .alert)
        
        //OKボタン
        alert.addAction(
                    UIAlertAction(
                        title: "OK",
                        style: .default,
                        handler: { action in
                            print("OKボタンが押されました!")
                        }
                    )
            )
        present(alert, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
