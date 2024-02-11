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

final class MyInfoCoordinator: Coordinator, MyInfoVCDelegate {
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
        let vc = MyInfoVC()
        vc.coordinator = self
        self.navigationController.pushViewController(vc, animated: true)
    }
    
    func didFinishMyInfo() {
        navigationController.popViewController(animated: true)
        delegate?.didFinishMyInfo(self)
    }

    func showHistory() {
        let coordinator = HistoryCoordinator(self.navigationController)
        coordinator.delegate = self
        self.addChildCoordinator(child: coordinator)
        coordinator.start()
    }
}

extension MyInfoCoordinator: HistoryCoordinatorDeleagate {
    func didFinishHistory(_ child: Coordinator) {
        removeChildCoordinator(child: child)
    }
}


