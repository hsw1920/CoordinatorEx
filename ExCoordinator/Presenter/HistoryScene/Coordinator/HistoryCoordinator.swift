//
//  HistoryCoordinator.swift
//  ExCoordinator
//
//  Created by 홍승완 on 2024/02/10.
//

import UIKit

protocol HistoryCoordinatorDeleagate {
    func didFinishHistory(_ child: Coordinator)
}

final class HistoryCoordinator: Coordinator {

    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var delegate: HistoryCoordinatorDeleagate?
    
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    deinit {
        print("- \(type(of: self)) deinit")
    }
    
    func start() {
        guard let rootVC = self.navigationController.viewControllers.first,
              rootVC is HomeVC else {
            return
        }

        let historyVC = HistoryVC()
        historyVC.coordinator = self

        self.navigationController.pushViewController(historyVC, animated: true)
    }
}

extension HistoryCoordinator: HistoryVCDelegate {
    func didFinishHistory() {
        navigationController.popViewController(animated: true)
        delegate?.didFinishHistory(self)
    }
    
    func showFirstShare() {
        let coordinator = ShareCoordinator(navigationController: self.navigationController, 
                                           sourceFlow: .history)
        coordinator.delegate = self
        self.addChildCoordinator(child: coordinator)
        coordinator.start()
    }
    
    func showSecondShare() {
        let coordinator = ShareCoordinator(navigationController: self.navigationController, 
                                           sourceFlow: .history)
        coordinator.delegate = self
        self.addChildCoordinator(child: coordinator)
        coordinator.start()
    }
}

extension HistoryCoordinator: ShareCoordinatorDeleagate {
    func didFinishShare(_ child: Coordinator) {
        removeChildCoordinator(child: child)
    }

}


