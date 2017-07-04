//
//  Math4kid.swift
//  Math
//
//  Created by Kien NgD on 7/3/17.
//  Copyright © 2017 Kien Nguyen. All rights reserved.
//

import UIKit

class Math4kid: UIViewController {

    @IBOutlet weak var lbl_dau: UILabel!
    
    @IBOutlet weak var btn_1: UIButton!
    @IBOutlet weak var btn_2: UIButton!
    @IBOutlet weak var btn_3: UIButton!
    
    @IBOutlet weak var lbl_so1: UILabel!
    @IBOutlet weak var lbl_so2: UILabel!
    
    @IBOutlet weak var lbl_thoigian: UILabel!
    
    @IBOutlet weak var lbl_dung: UILabel!
    @IBOutlet weak var lbl_sai: UILabel!
    
    @IBAction func btn_kq(_ sender: UIButton) {
        ktkq(sender)
        setRandom()
        start()
        
    }
    
    var random1: Int!
    var random2: Int!
    var tm = Timer()
    var thoigian = 0
    var dung = 0
    var sai = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tm = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector: #selector (dem), userInfo: nil, repeats: true)
        setRandom()
        start()
        
    }
    func start(){
        thoigian = 10
    }
    
    func dem(){
        thoigian -= 1
        lbl_thoigian.text = "\(thoigian)"
        if (thoigian == 0) {
            start()
            setRandom()
            sai = sai + 1
            lbl_sai.text = String(sai)
        }
    }
    
    func setRandom() {
        random1 = Int (arc4random_uniform(9) + 1 )
        random2 = Int (arc4random_uniform(8) + 1 )
        print("\(random1)\(random2)")
        lbl_so1.text = String(random1)
        lbl_so2.text = String(random2)
        randomdau()
        
    }
    
    func randomdau() {
        let dau = Int (arc4random_uniform(4) )
        print(dau)
        if (dau == 0 ){
            lbl_dau.text = "+"
        }
        else if (dau == 1) {
            lbl_dau.text = "-"
            while (random1 < random2) {
                random1 = Int (arc4random_uniform(9)+1)
                random2 = Int (arc4random_uniform(8)+1)
                lbl_so1.text = String(random1)
                lbl_so2.text = String(random2)
            }
            
        }
        else if (dau == 2 ){
            lbl_dau.text = "x"
        }
        else {
            lbl_dau.text = ":"
            var du = random1%random2
            while (du != 0){
                random1 = Int (arc4random_uniform(9)+1)
                random2 = Int (arc4random_uniform(8)+1)
                
                du = random1%random2
                lbl_so1.text = String(random1)
                lbl_so2.text = String(random2)
                
            }
            
        }
        randomvitri()
        
    }
    
    func randomvitri() {
        let vitri = Int (arc4random_uniform(3))
        
        while(random1 == random2 || random1 == ketqua() || random2 == ketqua()){
            random1 = Int(arc4random_uniform(10))
            random2 = Int(arc4random_uniform(10))
        } // random lại nếu 2 kết quả trùng nhau
        
        
        if (vitri == 0){
            btn_1.setTitle(String(random1), for: .normal)
            btn_2.setTitle(String(random2), for: .normal)
            btn_3.setTitle(String(ketqua()), for: .normal)
        }
        if (vitri == 1) {
            btn_1.setTitle(String(random1), for: .normal)
            btn_3.setTitle(String(random2), for: .normal)
            btn_2.setTitle(String(ketqua()), for: .normal)
            
        }
        
        if (vitri == 2) {
            btn_3.setTitle(String(random1), for: .normal)
            btn_2.setTitle(String(random2), for: .normal)
            btn_1.setTitle(String(ketqua()), for: .normal)
        }
        
    }
    
    func ketqua() -> Int {
        var ketqua = 0
        if (lbl_dau.text == "+"){
            ketqua = tong(p1: Int(lbl_so1.text!)!, p2: Int(lbl_so2.text!)!)
        }
        if (lbl_dau.text == "-"){
            ketqua = hieu(p1: Int(lbl_so1.text!)!, p2: Int(lbl_so2.text!)!)
        }
        if (lbl_dau.text == "x"){
            ketqua = tich(p1: Int(lbl_so1.text!)!, p2: Int(lbl_so2.text!)!)
        }
        if (lbl_dau.text == ":"){
            ketqua = thuong(p1: Int(lbl_so1.text!)!, p2: Int(lbl_so2.text!)!)
        }
        return ketqua
    }
    
    func tong(p1: Int, p2: Int) -> Int {
        return p1+p2
    }
    
    func hieu(p1: Int, p2: Int) -> Int {
        return p1-p2
    }
    
    func tich(p1: Int, p2: Int) -> Int {
        return p1*p2
    }
    
    func thuong(p1: Int, p2: Int) -> Int {
        return p1/p2
    }
    
    
    func ktkq(_ sender: UIButton ) {
        
        lbl_dung.text = String(dung)
        lbl_sai.text = String(sai)
        let tong = (Int(lbl_so1.text!)! + Int(lbl_so2.text!)!)
        let hieu = (Int(lbl_so1.text!)! - Int(lbl_so2.text!)!)
        let tich = (Int(lbl_so1.text!)! * Int(lbl_so2.text!)!)
        let thuong = (Int(lbl_so1.text!)! / Int(lbl_so2.text!)!)
        if tong == (Int(sender.currentTitle!)) || hieu == (Int(sender.currentTitle!)) ||
            thuong == (Int(sender.currentTitle!)) || tich == (Int(sender.currentTitle!))
        {
            dung = dung + 1
            lbl_dung.text = String(dung)
        }
        else {
            sai = sai + 1
            lbl_sai.text = String(sai)
        }
    }
    
}
