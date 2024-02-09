//
//  CSMemberVC.swift
//  ExCoordinator
//
//  Created by 홍승완 on 2024/02/08.
//

import UIKit

protocol CSMemberVCDelegate: AnyObject {
    func didFinishCreate()
    func showNextView(viewType: CreateViewType)
}

class CSMemberVC: UIViewController {

    weak var coordinator: CSMemberVCDelegate?

    private let label: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "CSMemberVC"
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
        view.backgroundColor = .systemRed
        
        view.addSubview(stackView)
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(nextButton)
        
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
    func nextButtonDidTap() {
        coordinator?.showNextView(viewType: .CSMember)
    }
}


