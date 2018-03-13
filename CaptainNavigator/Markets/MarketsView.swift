//
//  MarketsView.swift
//  CaptainNavigator
//
//  Created by Dybdal, Aksel on 26.02.2018.
//  Copyright © 2018 Aksel Dybdal. All rights reserved.
//

import UIKit

protocol MarketsViewDelegate: NSObjectProtocol {
    func didTapAdButton()
    func didTapSearchButton()
}

class MarketsView: UIView {

    private lazy var adButton: UIButton = {
        let button = UIButton(frame: .zero)

        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Present ad", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(adButtonTapped(_:)), for: .touchUpInside)

        return button
    }()

    private lazy var searchButton: UIButton = {
        let button = UIButton(frame: .zero)

        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Present search", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(searchButtonTapped(_:)), for: .touchUpInside)

        return button
    }()

    lazy var statusLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = .boldSystemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private weak var delegate: MarketsViewDelegate?

    init(delegate: MarketsViewDelegate) {
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
        backgroundColor = .green

        addSubview(statusLabel)
        addSubview(adButton)
        addSubview(searchButton)

        NSLayoutConstraint.activate([
            statusLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            statusLabel.bottomAnchor.constraint(equalTo: adButton.topAnchor, constant: -12),

            adButton.widthAnchor.constraint(equalToConstant: 150),
            adButton.heightAnchor.constraint(equalToConstant: 40),
            adButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            adButton.centerYAnchor.constraint(equalTo: centerYAnchor),

            searchButton.widthAnchor.constraint(equalToConstant: 150),
            searchButton.heightAnchor.constraint(equalToConstant: 40),
            searchButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            searchButton.topAnchor.constraint(equalTo: adButton.bottomAnchor, constant: 12),
            ])
    }

    @objc private func adButtonTapped(_ sender: UIButton) {
        delegate?.didTapAdButton()
    }

    @objc private func searchButtonTapped(_ sender: UIButton) {
        delegate?.didTapSearchButton()
    }
}

