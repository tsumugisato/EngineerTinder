//
//  CardView.swift
//  EngineerTinder
//
//  Created by 佐藤紬 on 2021/09/03.
//

import UIKit

class CardView:UIView{
    private let cardImageView = CardImageView(frame:.zero)
    private let nameLabel = CardInfoLabel(text: "♂佐藤紬(22)", font: .systemFont(ofSize: 50, weight: .heavy))
    private let historyLabel1 = CardInfoLabel(text: "Swift8ヶ月", font: .systemFont(ofSize:35,weight:.bold))
    private let historyLabel2 = CardInfoLabel(text: "Python半年", font: .systemFont(ofSize:35,weight:.bold))
    private let historyLabel3 = CardInfoLabel(text: "Rails5ヶ月", font: .systemFont(ofSize:35,weight:.bold))
    private let residenceLabel = CardInfoLabel(text: "東京都", font: .systemFont(ofSize: 25, weight: .regular))
    private let InternshipLabel = CardInfoLabel(text: "実務経験あり", font: .systemFont(ofSize:25,weight:.regular))
    private let IntroductionTextView = CardInfoLabel(text: "よろしくお願いします。",font: .systemFont(ofSize:25,weight:.regular))
    private let goodLabel = CardInfoLabel(text: "TRUE", textColor: .rgb(red: 36, green: 120, blue: 181))
    private let nopeLabel = CardInfoLabel(text: "FALSE", textColor: .rgb(red: 222, green: 110, blue: 110))
    


    override init(frame: CGRect) {
        super.init(frame:frame)
        setupLayout()
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panCardView))
        self.addGestureRecognizer(panGesture)
        
    }
    @objc private func panCardView(gesture:UIPanGestureRecognizer){
        let translation = gesture.translation(in: self)
        guard let view = gesture.view else {return}
        
        if gesture.state == .changed{
            self.handlesPanChange(translation: translation)
        }else if gesture.state == .ended {
            self.handelPanEnded(view:view,translation:translation)
            }
        }
        
    private func handlesPanChange(translation:CGPoint){
                let degree: CGFloat = translation.x / 20
                let angle = degree * .pi / 100
                
                let rotateTranslation = CGAffineTransform(rotationAngle: angle)
                self.transform = rotateTranslation.translatedBy(x: translation.x, y: translation.y)
                
                let ratio: CGFloat = 1 / 100
                let ratioValue = ratio * translation.x
                
                if translation.x > 0 {
                    self.goodLabel.alpha = ratioValue
                } else if translation.x < 0 {
                    self.nopeLabel.alpha = -ratioValue
                }
    }
    
    private func handelPanEnded(view:UIView,translation:CGPoint){
     
        print("translation.x;",translation.x)
        if translation.x <= -120 {
                  view.removeCardViewAnimation(x: -600)
              } else if translation.x >= 120 {
                  view.removeCardViewAnimation(x: 600)
              } else {
                UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.7, options: []) {
                      self.transform = .identity
                      self.layoutIfNeeded()
                      self.goodLabel.alpha = 0
                      self.nopeLabel.alpha = 0
                     
                  }
              }
        }
        
    private func setupLayout(){

    addSubview(cardImageView)
    addSubview(goodLabel)
    addSubview(nopeLabel)
    addSubview(IntroductionTextView)
        
        cardImageView.anchor(top:topAnchor,bottom:bottomAnchor,left:leftAnchor,right:rightAnchor,leftPadding: 10,rightPadding: 10)
        goodLabel.anchor(top:cardImageView.topAnchor,left:cardImageView.leftAnchor,width:140,height:55,topPadding: 25,leftPadding: 20)
        nopeLabel.anchor(top:cardImageView.topAnchor,right:cardImageView.rightAnchor,width:140,height:55,topPadding: 25,rightPadding: 20)
        IntroductionTextView.anchor(top: cardImageView.bottomAnchor,bottomPadding: 0, leftPadding: 10, rightPadding: -10)
        
        let infoVerticalStackView = UIStackView(arrangedSubviews: [nameLabel,residenceLabel,historyLabel1,historyLabel2,historyLabel3,InternshipLabel,IntroductionTextView])
        nameLabel.textAlignment = .center
        residenceLabel.textAlignment = .center
        historyLabel1.textAlignment = .center
        historyLabel2.textAlignment = .center
        historyLabel3.textAlignment = .center
        InternshipLabel.textAlignment = .center
        IntroductionTextView.textAlignment = .center
        IntroductionTextView.alpha = 1
        
            infoVerticalStackView.axis = .vertical
            infoVerticalStackView.spacing = 0
            infoVerticalStackView.distribution = .fillEqually
            infoVerticalStackView.translatesAutoresizingMaskIntoConstraints = false
        infoVerticalStackView.backgroundColor = .green
        infoVerticalStackView.layer.cornerRadius = 10
        
           
            
            self.addSubview(infoVerticalStackView)
            
        [infoVerticalStackView.topAnchor.constraint(equalTo: cardImageView.topAnchor, constant: 80),
         infoVerticalStackView.leftAnchor.constraint(equalTo: cardImageView.leftAnchor, constant: 10),
         infoVerticalStackView.rightAnchor.constraint(equalTo: cardImageView.rightAnchor, constant: -10),
         infoVerticalStackView.bottomAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: -10)
            
        ].forEach{$0.isActive = true}
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
