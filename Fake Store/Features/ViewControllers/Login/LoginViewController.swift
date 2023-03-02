//
//  LoginViewController.swift
//  Fake Store
//
//  Created by Sampas Bilisim on 28.02.2023.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    var viewModel = LoginViewModel()
    
    private let backImage: UIImageView = UIImageView()
    private let view1:UIView = UIView()
    private let stackView:UIStackView = UIStackView()
    private let userName:UITextField = UITextField()
    private let password:UITextField = UITextField()
    private let loginButton:UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        setupViewModelObserver()
    }
    
    //MARK: - ViewModel ve Data Binding işlemleri
    fileprivate func setupViewModelObserver() {
        
        viewModel.loginResponse.bind { [weak self] (item) in
            DispatchQueue.main.async { [self] in
                Methods.StartActivity(view: self!, viewController: ProductsViewController(), isNavigation: true)
            }
        }
        
        viewModel.isLoading.bind { [weak self] (isLoading) in
            guard let isLoading = isLoading else { return }
            DispatchQueue.main.async { [self] in
                isLoading ? self!.showHud("") : self!.hideHUD()
            }
        }
        
        viewModel.alertItem.bind{ [weak self] (alert) in
            DispatchQueue.main.async {
                let alert = UIAlertController(title: self?.viewModel.alertItem.value?.title ?? "Uyarı",
                                              message: "Kullanıcı Adı ve Şifrenizi Kontrol Ediniz",
                                              preferredStyle: .alert)
                let okButton = UIAlertAction(title: self?.viewModel.alertItem.value?.dismissButton ?? "Tamam", style: .default)
                alert.addAction(okButton)
                self?.present(alert, animated: true)
            }
        }
    }
    
    //MARK: Component constraint ayarları
    func configure(){
        view.addSubview(backImage)
        view.addSubview(view1)
        view1.addSubview(stackView)
        stackView.addArrangedSubview(userName)
        stackView.addArrangedSubview(password)
        stackView.addArrangedSubview(loginButton)
        
        backImage.image = UIImage(named: "login_back")
        backImage.contentMode = .scaleAspectFill
        backImage.clipsToBounds = true
        backImage.snp.makeConstraints{(maker) in
            maker.edges.equalToSuperview()
        }
        
        view1.backgroundColor = UIColor.init(named: "login_view_color")
        view1.layer.cornerRadius = 16
        view1.snp.makeConstraints{(maker) in
            maker.center.equalToSuperview()
            maker.leading.equalToSuperview().offset(40)
            maker.trailing.equalToSuperview().offset(-40)
        }
        
        stackView.axis = .vertical
        stackView.distribution  = UIStackView.Distribution.fillEqually
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing   = 10.0
        stackView.snp.makeConstraints{ (maker) in
            maker.top.equalTo(16)
            maker.bottom.equalTo(-16)
            maker.leading.equalTo(16)
            maker.trailing.equalTo(-16)
        }
        
        userName.placeholder = "Kullanıcı Adı Giriniz"
        userName.borderStyle = UITextField.BorderStyle.roundedRect
        userName.backgroundColor = .white
        userName.text = "mor_2314"
        
        password.placeholder = "Şifre Giriniz"
        password.borderStyle = UITextField.BorderStyle.roundedRect
        password.backgroundColor = .white
        password.text = "83r5^_"
        
        userName.snp.makeConstraints{ (maker) in
            maker.leading.equalTo(0)
            maker.trailing.equalTo(0)
            maker.height.equalTo(40)
        }
        
        password.snp.makeConstraints{ (maker) in
            maker.leading.equalTo(0)
            maker.trailing.equalTo(0)
            maker.height.equalTo(40)
        }
        
        loginButton.backgroundColor = UIColor(named: "login_button_color")
        loginButton.setTitle("Giriş Yap", for: .normal)
        loginButton.layer.cornerRadius = 8
        loginButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        loginButton.snp.makeConstraints{ (maker) in
            maker.leading.equalTo(0)
            maker.trailing.equalTo(0)
            maker.height.equalTo(40)
        }
    }
    
    @objc func buttonAction(sender: UIButton!) {
        viewModel.login(username: userName.text ?? "", password: password.text ?? "")
    }
}
