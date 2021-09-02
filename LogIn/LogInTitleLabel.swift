//
//  LogInTitleLabel.swift
//  EngineerTinder
//
//  Created by 佐藤紬 on 2021/09/01.
//

import UIKit

class LogInTitleLabel:UILabel{
    init(){
        super.init(frame:.zero)
        self.text = "Engineer\nTinder"
        self.font = .boldSystemFont(ofSize:70)
        self.textColor = .white
    }
    required init(coder:NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
