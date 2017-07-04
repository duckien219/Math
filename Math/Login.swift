//
//  Login.swift
//  Math
//
//  Created by Kien Nguyen Duc on 7/3/17.
//  Copyright © 2017 Kien Nguyen. All rights reserved.
//

import UIKit

class Login: UIViewController {

    @IBOutlet weak var txtf_user: UITextField!
    @IBOutlet weak var txtf_password: UITextField!
    
    @IBOutlet weak var lbl_noti: UILabel!
    
    
    
    
    var account = ["kien":"111", " user1":"1", "user2":"2"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    var count = 0
    
    @IBAction func btn_login(_ sender: UIButton) {
        if let password = account[txtf_user.text!] {
            if password == txtf_password.text{
                lbl_noti.text = "Đăng nhập thành công!"
                let math4kid = self.storyboard?.instantiateViewController(withIdentifier: "math4kid") as! Math4kid
                self.navigationController?.pushViewController(math4kid, animated: true)
                
            }else{
                lbl_noti.text = "Mật khẩu không đúng!"
            }
        }else {
            lbl_noti.text = "Tài khoản không tồn tại!"
        }
        
    }
    
    
    //Đăng ký tài khoản mới
    @IBAction func btn_register(_ sender: UIButton) {
        if let check = account[txtf_user.text!] {
            lbl_noti.text = "Tài khoản đã tồn tại!"
        }
        else if (txtf_user.text == "") {
            lbl_noti.text = "Chưa nhập tên tài khoản!"
            
        }else if (txtf_password.text == "") {
            lbl_noti.text = "Chưa nhập mật khẩu!"
        }else {
            account[txtf_user.text!] = txtf_password.text
            lbl_noti.text = "Đăng ký thành công!"
            
        }
        
        
        
    }
    
    
    
   }
