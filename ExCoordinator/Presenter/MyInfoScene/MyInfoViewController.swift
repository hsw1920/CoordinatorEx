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

class MyInfoViewController: UIViewController {
    weak var coordinator: MyInfoCoordinator?
    private let label: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "My Info"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    deinit {
        print("- \(type(of: self)) deinit")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        coordinator?.didFinishMyInfo()
    }
}
