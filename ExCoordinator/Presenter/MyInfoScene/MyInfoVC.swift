//
//  MyInfoViewController.swift
//  ExCoordinator
//
//  Created by 홍승완 on 2024/02/06.
//

import UIKit

protocol MyInfoViewControllerDelegate {
    func didFinishMyInfo()
}

class MyInfoVC: UIViewController {
    weak var coordinator: MyInfoCoordinator?
    
    private let label: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "MyInfo"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var myInfoFlowButton: UIButton = {
        let button = UIButton()
        button.setTitle("MyInfo", for: .normal)
        button.addTarget(self, action: #selector(myInfoFlowDidTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var historyFlowButton: UIButton = {
        let button = UIButton()
        button.setTitle("History", for: .normal)
        button.addTarget(self, action: #selector(historyFlowDidTap), for: .touchUpInside)
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

        view.addSubview(stackView)
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(myInfoFlowButton)
        stackView.addArrangedSubview(historyFlowButton)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
//        coordinator?.didFinishCreate()
    }
    
    @objc
    func myInfoFlowDidTap() {
        //self.coordinator?.showNextViewSmart()
    }
    
    @objc
    func historyFlowDidTap() {
        //self.coordinator?.showNextViewEqual()
    }
}
