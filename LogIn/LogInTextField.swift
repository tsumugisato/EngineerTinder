//
//  LogInTextField.swift
//  EngineerTinder
//
//  Created by 佐藤紬 on 2021/09/01.
//

import UIKit

class LogInTextField:UITextField{
    
    init(placeHolder:String){
        super.init(frame:.zero)
        
        placeholder = placeHolder
//        BorderStyle = .roundedRect
        font = .systemFont(ofSize: 14)
        layer.cornerRadius = 10
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
