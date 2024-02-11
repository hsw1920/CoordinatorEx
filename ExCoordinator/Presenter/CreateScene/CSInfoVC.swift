//
//  CSInfoVC.swift
//  ExCoordinator
//
//  Created by 홍승완 on 2024/02/07.
//

import UIKit

protocol CSInfoVCDelegate: AnyObject {
    func didFinishCreate()
    func showNextView(viewType: CreateViewType)
    func popBack()
}

class CSInfoVC: UIViewController {
    
    weak var coordinator: CSInfoVCDelegate?

    private let label: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "CSInfoVC"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Next", for: .normal)
        button.addTarget(self, action: #selector(nextButtonDidTap), for: .touchUpInside)
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
        setupNavigationItem(with: .closeCreate, target: self, action: #selector(closeButtonDidTap))
        setupNavigationItem(with: .back, target: self, action: #selector(backButtonDidTap))
        
        view.addSubview(stackView)
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(nextButton)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }

    @objc
    private func nextButtonDidTap() {
        coordinator?.showNextView(viewType: .CSInfo)
    }
    
    @objc
    private func closeButtonDidTap() {
        self.coordinator?.didFinishCreate()
    }
    
    @objc
    private func backButtonDidTap() {
        self.coordinator?.popBack()
    }
}


