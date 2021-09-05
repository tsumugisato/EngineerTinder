//
//  ProfileViewController.swift
//  EngineerTinder
//
//  Created by 佐藤紬 on 2021/09/04.
//


import UIKit
import RxSwift


class ProfileViewController: UIViewController {
    
    private let disposeBag = DisposeBag()
    var user: User?
    private let cellId = "cellId"

    private var name = ""
    private var age = ""
    private var email = ""
    private var residence = ""
    private var language1 = ""
    private var howlong1 = ""
    private var language2 = ""
    private var howlong2 = ""
    private var language3 = ""
    private var howlong3 = ""
    private var practice = ""
    private var introduction = ""
    
    var pickerView: UIPickerView = UIPickerView()
        let list: [String] = ["メインクーン", "シャム", "ロシアンブルー", "アメリカンショートヘア", "ネベロング", "ビクシーボブ", "ラガマフィン", "ラパーマ"]
        
    
    // MARK: UIViews
    let saveButton = UIButton(type: .system).createProfileTopButton(title: "保存")
    let logoutButton = UIButton(type: .system).createProfileTopButton(title: "ログアウト")

    let nameLabel = ProfileLabel()
    let profileEditButton = UIButton(type: .system).createProfileEditButton()
    
    lazy var infoColletionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.backgroundColor = .yellow
        cv.register(UserProfileInfoViewCell.self, forCellWithReuseIdentifier: cellId)
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        setupBindings()
    }
    
    private func setupBindings() {
        
        saveButton.rx.tap
            .asDriver()
            .drive { [weak self] _ in
                
                let dic = [
                    "name": self?.name,
                    "age": self?.age,
                    "email": self?.email,
                    "residence": self?.residence,
                    "language1":self?.language1,
                    "howlong1":self?.howlong1,
                    "language2":self?.language2,
                    "howlong2":self?.language2,
                    "language3":self?.language3,
                    "howlong3":self?.language3,
                    "practice":self?.practice,
                    "introduction": self?.introduction
                ]
                
//                Firestore.updateUserInfo(dic: dic) {
//                    print("更新完了")
//                }
//
            }
            .disposed(by: disposeBag)
    }
    
    private func setupLayout() {
        view.backgroundColor = .yellow

        nameLabel.text = "test test"
        
        // Viewの配置を設定
        view.addSubview(saveButton)
        view.addSubview(logoutButton)
        view.addSubview(nameLabel)
        view.addSubview(profileEditButton)
        view.addSubview(infoColletionView)

        saveButton.anchor(top: view.topAnchor, left: view.leftAnchor, topPadding: 20, leftPadding: 15)
        logoutButton.anchor(top: view.topAnchor, right: view.rightAnchor, topPadding: 20, rightPadding: 15)
//        profileImageView.anchor(top: view.topAnchor, centerX: view.centerXAnchor, width: 180, height: 180, topPadding: 60)
//        nameLabel.anchor(top: profileImageView.bottomAnchor, centerX: view.centerXAnchor, topPadding: 20)
//        profileEditButton.anchor(top: profileImageView.topAnchor, right: profileImageView.rightAnchor, width: 60, height: 60)
        infoColletionView.anchor(top: nameLabel.bottomAnchor, bottom: view.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, topPadding: 20)
        
        // ユーザー情報を反映
        nameLabel.text = user?.name
    }
}


// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = infoColletionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! UserProfileInfoViewCell
        cell.user = self.user
        setupCellBindings(cell: cell)
        return cell
    }
    
    private func setupCellBindings(cell: UserProfileInfoViewCell) {
        
        cell.nameTextField.rx.text
            .asDriver()
            .drive { [weak self] text in
                self?.name = text ?? ""
            }
            .disposed(by: disposeBag)
        
        cell.ageTextField.rx.text
            .asDriver()
            .drive { [weak self] text in
                self?.age = text ?? ""
            }
            .disposed(by: disposeBag)
        
        
        cell.emailTextField.rx.text
            .asDriver()
            .drive { [weak self] text in
                self?.email = text ?? ""
            }
            .disposed(by: disposeBag)
        
        cell.residenceTextField.rx.text
            .asDriver()
            .drive { [weak self] text in
                self?.residence = text ?? ""
            }
            .disposed(by: disposeBag)
        
        cell.language1TextField.rx.text
            .asDriver()
            .drive { [weak self] text in
                self?.language1 = text ?? ""
            }
            .disposed(by: disposeBag)
        
        cell.language2TextField.rx.text
            .asDriver()
            .drive { [weak self] text in
                self?.language2 = text ?? ""
            }
            .disposed(by: disposeBag)
        
        cell.language3TextField.rx.text
            .asDriver()
            .drive { [weak self] text in
                self?.language3 = text ?? ""
            }
            .disposed(by: disposeBag)
        
        cell.introductionTextField.rx.text
            .asDriver()
            .drive { [weak self] text in
                self?.introduction = text ?? ""
            }
            .disposed(by: disposeBag)
        
    }
    
}
