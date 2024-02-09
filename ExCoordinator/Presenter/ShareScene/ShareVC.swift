//
//  ShareVC.swift
//  ExCoordinator
//
//  Created by 홍승완 on 2024/02/08.
//

import UIKit

protocol ShareVCDelegate {
    func didFinishShare()
    func closeShare()
}

class ShareVC: UIViewController {

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        
        print("navigationController: \(navigationController?.viewControllers)")
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        coordinator?.didFinishShare()
    }

    @objc
    func closeShare() {
        coordinator?.closeShare()
    }
}




