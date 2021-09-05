//
//  LogInViewController.swift
//  EngineerTinder
//
//  Created by 佐藤紬 on 2021/09/01.
//

import UIKit
import RxSwift
import RxCocoa
import Moya
//import FirebaseAuth
//import FirebaseFirestore

class LogInViewController:UIViewController{
    
    var users = [User]()
    let userProvider = MoyaProvider<MyService>()
    
    private let disposeBag = DisposeBag()
    private let viewModel = LogInViewModel()
    
    //MARK:UIViews
    private let titleLabel = LogInTitleLabel()
    private let nameTextField = LogInTextField(placeHolder: "名前")
    private let emailTextField = LogInTextField(placeHolder:"email")
    private let passwordTextField = LogInTextField(placeHolder:"password")
    private let registerButton = LogInButton()
    
    override func viewDidLoad() {
        setupGradientLayer()
        setupLayout()
//        setupBindings()
        nameTextField.backgroundColor = .white
        emailTextField.backgroundColor = .white
        passwordTextField.backgroundColor = .white
        
    }
    private func setupGradientLayer(){
        let layer = CAGradientLayer()
        let startColor = UIColor.rgb(red: 72, green: 48,blue: 227).cgColor
        let endColor = UIColor.rgb(red: 204, green: 255, blue: 0).cgColor
        
        layer.colors = [startColor,endColor]
        layer.locations = [0.0,1.3]
        layer.frame = view.bounds
        view.layer.addSublayer(layer)
    }
    
    private func setupLayout(){
        passwordTextField.isSecureTextEntry = true
        view.backgroundColor = .red
        
        let baseStackView = UIStackView(arrangedSubviews: [nameTextField,emailTextField,passwordTextField,registerButton])
        baseStackView.axis = .vertical
        baseStackView.distribution = .fillEqually
        baseStackView.spacing = 30
        
        view.addSubview(baseStackView)
        view.addSubview(titleLabel)
        nameTextField.anchor(height:45)
        baseStackView.anchor(left:view.leftAnchor,right: view.rightAnchor,centerY: view.centerYAnchor,leftPadding: 40,rightPadding: 40)
        titleLabel.anchor(bottom:baseStackView.topAnchor,centerX:view.centerXAnchor,bottomPadding:100)
    }
    
    private func setupBindings(){

        nameTextField.rx.text
            .asDriver()
            .drive {[weak self] text in
                self?.viewModel.nameTextInput.onNext(text ?? "")
            }

        nameTextField.rx.text
            .asDriver()
            .drive{ [weak self] text in
                self?.viewModel.emailTextInput.onNext(text ?? "")
                //textの情報ハンドル
            }
            .disposed(by: disposeBag)
        emailTextField.rx.text
            .asDriver()
            .drive{ [weak self] text in
                self?.viewModel.passwordTextInput.onNext(text ?? "")
                //textの情報ハンドル
            }
            .disposed(by: disposeBag)

        passwordTextField.rx.text
            .asDriver()
            .drive{ [weak self] text in
                self?.viewModel.nameTextInput.onNext(text ?? "")
                //textの情報ハンドル
            }
            .disposed(by: disposeBag)
//
        registerButton.rx.tap
            .asDriver()
            .drive{[weak self] _ in
                //登録時の処理
                self?.readUser()
                self?.dismiss(animated: true)
            }
            .disposed(by:disposeBag)

    }
    
    private func readUser(){
        userProvider.request(.users){ (result) in
            switch result{
            case .success(let response):
                let json = try!JSONSerialization.jsonObject(with:response.data,options: [])
                print(json,"成功")
            case .failure(let error):
                print(error,"失敗")
            }
        }
    }

//    private func createUserToFireAuth(){
//        guard let email = emailTextField.text else {return}
//        guard let password = passwordTextField.text else {return}
//
//        Auth.auth().createUser(withEmail: email, password: password){(auth,err) in
//            if let err = err {
//                print("auth情報の保存に失敗:",err)
//                return
//            }
//
//            guard let uid = auth?.user.uid else {return}
//            self.setUserDataToFireStore(email:email,uid:uid)
//        }
//    }
//    private func setUserDataToFireStore(email:String,uid:String){
//        guard let name = nameTextField.text else {return}
//
//        let document = [
//            "name" : name,
//            "email" : email,
//            "createdAt" : Timestamp()
//        ] as [String:Any]
//
//        Firestore.firestore().collection("users").document(uid).setData(document){
//            err in
//
//            if let err = err{
//                print("ユーザー情報のfirestoreへの保存に失敗",err)
//                return
//            }
//            print("ユーザー情報のfirestoreへの保存に成功")
//        }
//    }
}
