//
//  ProfileView.swift
//  EngineerTinder
//
//  Created by 佐藤紬 on 2021/09/05.
//

import UIKit

class ProfileLabel: UILabel {
    
    init() {
        super.init(frame: .zero)
        
        self.font = .systemFont(ofSize: 45, weight: .bold)
        self.textColor = .black
    }
    
    // infoCollectionViewCellのtitleLabel
    init(title: String) {
        super.init(frame: .zero)
        
        self.text = title
        self.textColor = .darkGray
        self.font = .systemFont(ofSize: 14)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
