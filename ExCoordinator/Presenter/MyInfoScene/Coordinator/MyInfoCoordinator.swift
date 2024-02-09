//
//  MyInfoCoordinator.swift
//  ExCoordinator
//
//  Created by 홍승완 on 2024/02/06.
//

import UIKit

protocol MyInfoCoordinatorDelegate {
    func didFinishMyInfo(_ child: Coordinator)
}

final class MyInfoCoordinator: Coordinator, MyInfoViewControllerDelegate {
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var delegate: MyInfoCoordinatorDelegate?
    
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    deinit {
        print("- \(type(of: self)) deinit")
    }
    
    func start() {
        let vc = MyInfoViewController()
        vc.coordinator = self
        self.navigationController.pushViewController(vc, animated: true)
    }
    
    func didFinishMyInfo() {
        delegate?.didFinishMyInfo(self)
    }
}



