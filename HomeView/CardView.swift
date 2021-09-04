//
//  CardView.swift
//  EngineerTinder
//
//  Created by 佐藤紬 on 2021/09/03.
//

import UIKit

class CardView:UIView{
    private let cardImageView = CardImageView(frame:.zero)
    private let nameLabel = CardInfoLabel(text: "佐藤紬", font: .systemFont(ofSize: 40, weight: .heavy))
    private let residenceLabel = CardInfoLabel(text: "Swift1年\nPython8ヶ月", font: .systemFont(ofSize:20,weight:.regular))
    private let introductionLabel = CardInfoLabel(text: "東京都", font: .systemFont(ofSize: 25, weight: .regular))
    
    private let goodLabel = CardInfoLabel(text: "TRUE", textColor: .rgb(red: 137, green: 223, blue: 86))

    private let nopeLabel = CardInfoLabel(text: "FALSE", textColor: .rgb(red: 222, green: 110, blue: 110))
    
    private let hobbyLabel = CardInfoLabel(text: "", font: .systemFont(ofSize:25,weight:.regular))
    
//        let resiedenceLabel:UILabel = {
//        let label = UILabel()
//        label.font =  UIFont.systemFont(ofSize:20,weight:.regular)
//        label.textColor = .white
//        label.text = "日本、山口"
//        return label
//    }()
    


    override init(frame: CGRect) {
        super.init(frame:frame)
        
        setupLayout()
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panCardView))
        self.addGestureRecognizer(panGesture)
        
    }
    
    @objc private func panCardView(gesture:UIPanGestureRecognizer){
        let translation = gesture.translation(in: self)
        
        if gesture.state == .changed{
            self.handlesPanChange(translation: translation)
        }else if gesture.state == .ended {
            self.handelPanEnded()
            }
        }
        
    private func handlesPanChange(translation:CGPoint){
        let degree:CGFloat = translation.x/20
        let angle = degree * .pi/100
        
        let rotateTranslation = CGAffineTransform(rotationAngle:angle)
        self.transform = rotateTranslation.translatedBy(x:translation.x,y:translation.y)
        
        let ratio:CGFloat = 1/100
        let ratioValue = ratio * translation.x
        
        print("translation.x:",translation.x)
        
        if translation.x > 0{
            self.goodLabel.alpha = ratioValue
        }else if translation.x < 0{
            self.nopeLabel.alpha =  -ratioValue
        }
    }
    
    private func handelPanEnded(){
     
        
        UIView.animate(withDuration:1,delay:0,usingSpringWithDamping: 0.7,initialSpringVelocity:0.5,options:[]) {
            self.transform = .identity
            self.layoutIfNeeded()
            self.goodLabel.alpha = 0
            self.nopeLabel.alpha = 0
        }
    }
    private func setupLayout(){
    let infoVerticalStackView = UIStackView(arrangedSubviews: [residenceLabel,hobbyLabel,introductionLabel])
        infoVerticalStackView.axis = .vertical

    let baseStackView = UIStackView(arrangedSubviews: [infoVerticalStackView])
        baseStackView.axis = .horizontal

    addSubview(cardImageView)
    addSubview(nameLabel)
    addSubview(baseStackView)
    addSubview(goodLabel)
    addSubview(nopeLabel)
        
        cardImageView.anchor(top:topAnchor,bottom:bottomAnchor,left:leftAnchor,right:rightAnchor,leftPadding: 10,rightPadding: 10)
        baseStackView.anchor(bottom: cardImageView.bottomAnchor,left:cardImageView.leftAnchor,right:cardImageView.rightAnchor,bottomPadding:20,leftPadding:20,rightPadding:20)
        goodLabel.anchor(top:cardImageView.topAnchor,left:cardImageView.leftAnchor,width:140,height:55,topPadding: 25,leftPadding: 20)
        nopeLabel.anchor(top:cardImageView.topAnchor,right:cardImageView.rightAnchor,width:140,height:55,topPadding: 25,rightPadding: 20)
        nameLabel.anchor(bottom:baseStackView.topAnchor,left: cardImageView.leftAnchor,bottomPadding: 10,leftPadding: 20)
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
