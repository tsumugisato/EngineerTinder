//
//  CardImageView.swift
//  EngineerTinder
//
//  Created by 佐藤紬 on 2021/09/03.
//

import UIKit

class CardImageView:UIView{
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .blue
        layer.cornerRadius = 10
        contentMode = .scaleAspectFill
        backgroundColor = .yellow
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

