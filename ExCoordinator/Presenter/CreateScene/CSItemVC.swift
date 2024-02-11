//
//  CSItemVC.swift
//  ExCoordinator
//
//  Created by 홍승완 on 2024/02/08.
//

import UIKit

protocol CSItemVCDelegate {
    func didFinishCreate()
    func showNextView(viewType: CreateViewType)
    func popBack()
}

class CSItemVC: UIViewController {

    weak var coordinator: SmartCoordinator?
    
    private let label: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "CSItemVC"
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
        view.backgroundColor = .systemCyan
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
        coordinator?.showNextView(viewType: .CSItem)
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




