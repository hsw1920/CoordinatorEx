//
//  ViewController.swift
//  ExCoordinator
//
//  Created by 홍승완 on 2024/02/03.
//

import UIKit

protocol SplitMethodVCDelegate {
    func showNextViewSmart()
    func showNextViewEqual()
    func popBack()
}

class SplitMethodVC: UIViewController {
    
    weak var coordinator: CreateCoordinator?
    
    private let label: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "SplitMethod"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var smartFlowButton: UIButton = {
        let button = UIButton()
        button.setTitle("Smart", for: .normal)
        button.addTarget(self, action: #selector(smartFlowDidTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var equalFlowButton: UIButton = {
        let button = UIButton()
        button.setTitle("Equal", for: .normal)
        button.addTarget(self, action: #selector(equalFlowDidTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    deinit {
        print("- \(type(of: self)) deinit")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBrown
        setupNavigationItem(with: .back, target: self, action: #selector(backButtonDidTap))

        view.addSubview(stackView)
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(smartFlowButton)
        stackView.addArrangedSubview(equalFlowButton)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    @objc
    private func smartFlowDidTap() {
        self.coordinator?.showNextViewSmart()
    }
    
    @objc
    private func equalFlowDidTap() {
        self.coordinator?.showNextViewEqual()
    }
    
    @objc
    private func backButtonDidTap() {
        self.coordinator?.popBack()
    }
}


