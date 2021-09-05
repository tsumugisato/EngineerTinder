//
//  CardInfoLabel.swift
//  EngineerTinder
//
//  Created by 佐藤紬 on 2021/09/04.
//

import UIKit

class CardInfoLabel:UILabel{
    
    //nopeとgoodのラベル
    init(text:String,textColor:UIColor) {
        super.init(frame: .zero)
        
        font = .boldSystemFont(ofSize:45)
        self.text = text//ラベルのテキストと、引数のテキストで識別するためにselfが必要。
        self.textColor = textColor
        
//        layer.borderWidth = 3
//        layer.borderColor = UIColor.rgb(red:222,green:110,blue:110).cgColor
//        layer.cornerRadius = 10
        
        textAlignment = .center
        alpha = 0
    }
    
    init(text:String,font:UIFont){
        super.init(frame:.zero)
        self.font = font
        self.textColor = .black
        self.text = text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
        
    }
}
