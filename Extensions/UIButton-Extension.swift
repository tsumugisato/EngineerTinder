//
//  UIButton-Extension.swift
//  EngineerTinder
//
//  Created by 佐藤紬 on 2021/09/05.
//

import UIKit

extension UIButton{

    func createProfileTopButton(title: String) -> UIButton {
       self.setTitle(title, for: .normal)
       self.titleLabel?.font = .systemFont(ofSize: 15)
       return self
   }
    func createProfileEditButton() -> UIButton {
         let image = UIImage(systemName: "square.and.pencil")
         self.setImage(image, for: .normal)
         
         self.layer.cornerRadius = 30
         self.tintColor = .darkGray
         self.imageView?.contentMode = .scaleToFill
         self.backgroundColor = .white
         return self
     }
     
}
