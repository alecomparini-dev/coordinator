//
//  FirstView.swift
//  coordinator
//
//  Created by Alessandro Comparini on 16/08/23.
//

import UIKit

protocol FirstViewDelegate: AnyObject {
    func goToSecondButtonTapped()
    func goToThirdButtonTapped()
}

class FirstView: UIView {
    weak var delegate: FirstViewDelegate?
    
    init() {
        super.init(frame: .zero)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
//  MARK: - LAZY AREA
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "SCREEN 1"
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 50)
        lbl.textColor = .black
        return lbl
    }()

    lazy var goToSecondButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("GO SCREEN 2", for: .normal)
        btn.tintColor = .white
        btn.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title1)
        btn.addTarget(self, action: #selector(goToSecondButtonTapped), for: .touchUpInside)
        return btn
    }()
    @objc func goToSecondButtonTapped() {
        delegate?.goToSecondButtonTapped()
    }

    lazy var goToThirdButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("GO SCREEN 3", for: .normal)
        btn.tintColor = .white
        btn.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title1)
        btn.addTarget(self, action: #selector(goToThirdButtonTapped), for: .touchUpInside)
        return btn
    }()
    @objc func goToThirdButtonTapped() {
        delegate?.goToThirdButtonTapped()
    }
    
    lazy var stackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [titleLabel, goToSecondButton, goToThirdButton])
        sv.axis = .vertical
        sv.spacing = 50
        sv.alignment = .center
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    
    
//  MARK: - PRIVATE AREA
    private func configureView() {
        configBackgroundColor()
        configConstraints()
    }
    
    private func configBackgroundColor() {
        backgroundColor = UIColor.systemIndigo
    }
    
    private func configConstraints() {
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -100),
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
        
        titleLabel.heightAnchor.constraint(equalToConstant: 250).isActive = true
    }
    
}
