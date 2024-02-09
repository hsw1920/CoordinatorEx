//
//  MainViewController.swift
//  ExCoordinator
//
//  Created by 홍승완 on 2024/02/03.
//

import UIKit

protocol HomeVCDelegate {
    func didFinishHome()
    func showCreate()
    func showMyInfo()
}

class HomeVC: UIViewController {

    var coordinator: HomeCoordinator?
    
    lazy var createButton = UIBarButtonItem(
        title: "create",
        style: .plain,
        target: self,
        action: #selector(self.createButtonDidTap)
    )
    
    lazy var myInfoButton = UIBarButtonItem(
        title: "myInfo",
        style: .plain,
        target: self,
        action: #selector(self.myInfoButtonDidTap)
    )
    
    private let label: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Home"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    deinit {
        print("- \(type(of: self)) deinit")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        self.navigationItem.rightBarButtonItem = myInfoButton
        self.navigationItem.leftBarButtonItem = createButton
        
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("navigationController: \(navigationController?.viewControllers)")
        print("child: \(coordinator?.childCoordinators)")
        
        print("After All viewControllers: \(self.navigationController?.viewControllers)")
        print("ViewCounts: \(navigationController?.viewControllers.count)")
    }

    @objc
    func myInfoButtonDidTap() {
        self.coordinator?.showMyInfo()
    }
    
    @objc
    func createButtonDidTap() {
        self.coordinator?.showCreate()
    }
}
