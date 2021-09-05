//
//  UserProfileInfo.swift
//  EngineerTinder
//
//  Created by 佐藤紬 on 2021/09/05.
//

import UIKit

class UserProfileInfoViewCell: UICollectionViewCell {
    
    var user: User? {
        didSet {
            nameTextField.text = user?.name
            emailTextField.text = user?.email
            ageTextField.text = user?.age
            residenceTextField.text = user?.residence
            language1TextField.text = user?.language1
            language2TextField.text = user?.language2
            language3TextField.text = user?.language3
            introductionTextField.text = user?.introduction
        }
    }
    
    // MARK: UIViews
    let nameLabel = ProfileLabel(title:"名前")
    let ageLabel = ProfileLabel(title: "年齢")
    let emailLabel = ProfileLabel(title: "email")
    let residenceLabel = ProfileLabel(title: "居住地")
    let language1Label = ProfileLabel(title: "得意なプログラミング言語第1位")
    let howlong1Label = ProfileLabel(title: "期間")
    let language2Label = ProfileLabel(title: "得意なプログラミング言語第2位")
    let howlong2Label = ProfileLabel(title: "期間")
    let language3Label = ProfileLabel(title: "得意なプログラミング言語第3位")
    let howlong3Label = ProfileLabel(title: "期間")
    let practiceLabel = ProfileLabel(title:"実務経験")
    let introductionLabel = ProfileLabel(title: "一言")
    
    let nameTextField = ProfileTextField(placeholder: "名前")
    let ageTextField = ProfileTextField(placeholder: "年齢")
    let emailTextField = ProfileTextField(placeholder: "email")
    let residenceTextField = ProfileTextField(placeholder: "居住地")
    let language1TextField = ProfileTextField(placeholder: "得意なプログラミング言語第1位")
    let howlong1TextField = ProfileTextField(placeholder: "期間")
    
    let language2TextField = ProfileTextField(placeholder: "得意なプログラミング言語第2位")
    let howlong2TextField = ProfileTextField(placeholder: "期間")
    let language3TextField = ProfileTextField(placeholder: "得意なプログラミング言語第3位")
    let howlong3TextField = ProfileTextField(placeholder: "期間")
    let practiceTextField = ProfileTextField(placeholder: "あり/なし")
    let introductionTextField = ProfileTextField(placeholder: "よろしくお願いします。")
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        let views = [[nameLabel, nameTextField], [ageLabel, ageTextField], [emailLabel, emailTextField], [residenceLabel, residenceTextField], [language1Label, language1TextField],[howlong1Label,howlong1TextField],[language2Label,language2TextField],[howlong2Label,howlong2TextField],[language3Label,language3TextField], [howlong3Label,howlong3TextField],[introductionLabel, introductionTextField]]
        
        let stackViews = views.map { (views) -> UIStackView in
            guard let label = views.first as? UILabel,
                  let textField = views.last as? UITextField else { return UIStackView() }
            
            let stackView = UIStackView(arrangedSubviews: [label, textField])
            stackView.axis = .vertical
            stackView.spacing = 5
            textField.anchor(height: 50)
            return stackView
        }
        
        
        let baseStackView = UIStackView(arrangedSubviews: stackViews)
        baseStackView.axis = .vertical
        baseStackView.spacing = 15
        
        addSubview(baseStackView)
        nameTextField.anchor(width: UIScreen.main.bounds.width - 40, height: 80)
        baseStackView.anchor(top: topAnchor, bottom: bottomAnchor, left: leftAnchor, right: rightAnchor, topPadding: 10, leftPadding: 20, rightPadding: 20)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
