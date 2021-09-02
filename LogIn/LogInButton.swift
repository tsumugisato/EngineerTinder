//
//  LogInButton.swift
//  EngineerTinder
//
//  Created by 佐藤紬 on 2021/09/01.
//

import UIKit

class LogInButton:UIButton{
    override var isHighlighted: Bool{
        didSet{
            self.backgroundColor = isHighlighted ?
                .rgb(red:72,green: 200,blue: 255,alpha: 0.2):.rgb(red: 72, green: 200, blue: 255)
        }
    }
    init(){
        super.init(frame:.zero)
        setTitle("登録",for:.normal)
        backgroundColor = .rgb(red: 153, green: 204,blue: 255)
        setTitleColor(.white, for: .normal)
        layer.cornerRadius = 10
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
