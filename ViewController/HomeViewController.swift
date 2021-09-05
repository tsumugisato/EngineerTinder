//
//  HomeViewController.swift
//  EngineerTinder
//
//  Created by 佐藤紬 on 2021/09/03.
//

import UIKit
import RxSwift
import RxCocoa

class HomeViewController: UIViewController {
    
    private var isCardAnimating = false
    
    let topControlView = TopViewController()
    let cardView = CardView()
    let bottomControlView = BottomControlView()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setupLayout()
        setupbindings()
    }

    private func setupLayout(){
        view.backgroundColor = .yellow
      
        let stackView = UIStackView(arrangedSubviews: [topControlView, cardView, bottomControlView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
                
                self.view.addSubview(stackView)
                
                [
                    topControlView.heightAnchor.constraint(equalToConstant: 100),
                    bottomControlView.heightAnchor.constraint(equalToConstant: 120),
                    
                    stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                    stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                    stackView.leftAnchor.constraint(equalTo: view.leftAnchor),
                    stackView.rightAnchor.constraint(equalTo: view.rightAnchor)]
                    .forEach { $0.isActive = true }
        
        [
                    topControlView.heightAnchor.constraint(equalToConstant: 100),
                    bottomControlView.heightAnchor.constraint(equalToConstant: 120),
                    
                    stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                    stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                    stackView.leftAnchor.constraint(equalTo: view.leftAnchor),
                    stackView.rightAnchor.constraint(equalTo: view.rightAnchor)]
                    .forEach { $0.isActive = true }
        
    }
    private func setupbindings(){
        topControlView.profileButton.rx.tap
            .asDriver()
            .drive{[weak self]_ in
                let profile = ProfileViewController()
                self?.present(profile, animated: true, completion: nil)
            }
            .disposed(by: disposeBag)
        
    bottomControlView.backView.button?.rx.tap
               .asDriver()
               .drive { [weak self] _ in
//                   self?.fetchUsers()
               }
               .disposed(by: disposeBag)
           
//           bottomControlView.nopeView.button?.rx.tap
//               .asDriver()
//               .drive { [weak self] _ in
//                   guard let self = self else { return }
//
//                   if !self.isCardAnimating {
//                       self.isCardAnimating = true
//                       self.cardView.subviews.last?.removeCardViewAnimation(x: -600, completion: {
//                           self.isCardAnimating = false
//                       })
//                   }
//               }
//               .disposed(by: disposeBag)
//
//           bottomControlView.likeView.button?.rx.tap
//               .asDriver()
//               .drive { [weak self] _ in
//                   guard let self = self else { return }
//
//                   if !self.isCardAnimating {
//                       self.isCardAnimating = true
//                       self.cardView.subviews.last?.removeCardViewAnimation(x: 600, completion: {
//                           self.isCardAnimating = false
//                       })
//                   }
//               }
//               .disposed(by: disposeBag)

       }
    
    
}
