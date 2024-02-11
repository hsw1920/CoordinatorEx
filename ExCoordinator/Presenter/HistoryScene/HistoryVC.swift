//
//  HistoryVC.swift
//  ExCoordinator
//
//  Created by 홍승완 on 2024/02/10.
//

import UIKit

protocol HistoryVCDelegate {
    func didFinishHistory()
    func showFirstShare()
    func showSecondShare()
}

class HistoryVC: UIViewController {
    weak var coordinator: HistoryCoordinator?
    
    private let label: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "History"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var firstCS: UIButton = {
        let button = UIButton()
        button.setTitle("첫 번째 정산", for: .normal)
        button.addTarget(self, action: #selector(firstDidTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var secondCS: UIButton = {
        let button = UIButton()
        button.setTitle("두 번째 정산", for: .normal)
        button.addTarget(self, action: #selector(secondDidTap), for: .touchUpInside)
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
        stackView.addArrangedSubview(firstCS)
        stackView.addArrangedSubview(secondCS)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    @objc
    private func firstDidTap() {
        self.coordinator?.showFirstShare()
    }
    
    @objc
    private func secondDidTap() {
        self.coordinator?.showSecondShare()
    }
    
    @objc
    private func backButtonDidTap() {
        self.coordinator?.didFinishHistory()
    }
}

