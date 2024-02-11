//
//  ShareVC.swift
//  ExCoordinator
//
//  Created by 홍승완 on 2024/02/08.
//

import UIKit

protocol ShareVCDelegate {
    func didFinishShare()
}

final class ShareVC: UIViewController {

    weak var coordinator: ShareCoordinator?
    
    private let label: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Share"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    deinit {
        print("- \(type(of: self)) deinit")
    }
    
    init(buttonType: ButtonType) {
        super.init(nibName: nil, bundle: nil)
        
        setupNavigationItem(with: buttonType, target: self, action: #selector(dismissShare))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }

    @objc
    private func dismissShare() {
        coordinator?.didFinishShare()
    }
}




