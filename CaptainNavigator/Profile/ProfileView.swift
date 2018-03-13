//
//  ProfileView.swift
//  CaptainNavigator
//
//  Created by Dybdal, Aksel on 26.02.2018.
//  Copyright © 2018 Aksel Dybdal. All rights reserved.
//

import UIKit

protocol ProfileViewDelegate: NSObjectProtocol {
    func didTapLogOut()
}

class ProfileView: UIView {

    private lazy var logOutButton: UIButton = {
        let button = UIButton(frame: .zero)

        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Log out", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(logOutTapped(_:)), for: .touchUpInside)

        return button
    }()


    private weak var delegate: ProfileViewDelegate?

    init(delegate: ProfileViewDelegate) {
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
        backgroundColor = .red

        addSubview(logOutButton)

        NSLayoutConstraint.activate([
            logOutButton.widthAnchor.constraint(equalToConstant: 150),
            logOutButton.heightAnchor.constraint(equalToConstant: 40),
            logOutButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            logOutButton.centerYAnchor.constraint(equalTo: centerYAnchor),

            ])
    }

    @objc private func logOutTapped(_ sender: UIButton) {
        delegate?.didTapLogOut()
    }
}
