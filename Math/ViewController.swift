//
//  ViewController.swift
//  Math
//
//  Created by Kien Nguyen Duc on 7/3/17.
//  Copyright © 2017 Kien Nguyen. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
var logo = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addLogo()
        logo.alpha = 0
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIView.animate(withDuration: 3, animations: {
            self.logo.alpha = 1
            
        }){_ in
            UIView.animate(withDuration: 0, animations: {
                print("in")
                
                let login = self.storyboard?.instantiateViewController(withIdentifier: "login") as! Login
                self.navigationController?.pushViewController(login, animated: true)
                
            })
        }
    }
    
    
    
    func addLogo() {
        logo = UIImageView(frame: CGRect(x: 0, y: 0 , width: view.bounds.size.width, height: view.bounds.size.height))
        logo.image = UIImage(named: "Math.jpg")
        self.view.addSubview(logo)
        
        
        
        
        
        
    }
    

}

