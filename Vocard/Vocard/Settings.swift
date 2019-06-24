//
//  Settings.swift
//  Vocard
//
//  Created by 모설아 on 23/06/2019.
//  Copyright © 2019 Snow. All rights reserved.
//

import UIKit

class Settings: UIViewController {
    
    var userProperties: UserProperties = UserProperties()
    
    @IBOutlet var numOfVocaTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        numOfVocaTF.text = "\(userProperties.numOfVocaPerDay)"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if let s = numOfVocaTF.text {   //  텍스트 필드 공백 체크
            if let num = Int(s) {   //  정수 변환 성공 체크, 유효값일 시 UserDefaults 수정.
                userProperties.numOfVocaPerDay = num
                UserDefaults.standard.synchronize()
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

}

