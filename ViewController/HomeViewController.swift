//
//  HomeViewController.swift
//  EngineerTinder
//
//  Created by 佐藤紬 on 2021/09/03.
//

import UIKit
class HomeViewController: UIViewController {
    
    let topControlView = TopViewController()
    let cardView = CardView()
    let bottomControlView = BottomControlView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setupLayout()
    }

    private func setupLayout(){
        view.backgroundColor = .white
      
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
}
