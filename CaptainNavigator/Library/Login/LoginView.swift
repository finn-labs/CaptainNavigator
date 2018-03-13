//
//  LoginView.swift
//  CaptainNavigator
//
//  Created by Dybdal, Aksel on 27.02.2018.
//  Copyright © 2018 Aksel Dybdal. All rights reserved.
//

import UIKit

protocol LoginViewDelegate: NSObjectProtocol {
    func didTapLogIn()
}

class LoginView: UIView {

    private lazy var logInButton: UIButton = {
        let button = UIButton(frame: .zero)

        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Log in", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(logInTapped(_:)), for: .touchUpInside)

        return button
    }()


    private weak var delegate: LoginViewDelegate?

    init(delegate: LoginViewDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        setup()
    }

    public override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setup()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    private func setup() {
        backgroundColor = .cyan

        addSubview(logInButton)

        NSLayoutConstraint.activate([
            logInButton.widthAnchor.constraint(equalToConstant: 150),
            logInButton.heightAnchor.constraint(equalToConstant: 40),
            logInButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            logInButton.centerYAnchor.constraint(equalTo: centerYAnchor),

            ])
    }

    @objc private func logInTapped(_ sender: UIButton) {
        delegate?.didTapLogIn()
    }
}
