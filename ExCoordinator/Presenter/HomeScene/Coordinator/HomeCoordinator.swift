//
//  MainCoordinator.swift
//  ExCoordinator
//
//  Created by 홍승완 on 2024/02/03.
//

import Foundation
import UIKit

protocol HomeCoordinatorDeleagate {
    func didFinishHome(_ child: Coordinator)
}

final class HomeCoordinator: Coordinator, HomeVCDelegate {
    
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var delegate: HomeCoordinatorDeleagate?
    
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    deinit {
        print("- \(type(of: self)) deinit")
    }
    
    func start() {
        let vc = HomeVC()
        vc.coordinator = self
        self.navigationController.viewControllers = [vc]
    }
    
    func didFinishHome() {
        print(">>>>>>>>>>><<<<<<<<<<<<<")
        delegate?.didFinishHome(self)
    }
    
}

extension HomeCoordinator: MyInfoCoordinatorDelegate {
    func didFinishMyInfo(_ child: Coordinator) {
        removeChildCoordinator(child: child)
    }
    
    func showMyInfo() {
        let coordinator = MyInfoCoordinator(self.navigationController)
        coordinator.delegate = self
        self.addChildCoordinator(child: coordinator)
        coordinator.start()
    }
}

extension HomeCoordinator: CreateCoordinatorDelegate {
    
    func didFinishCreate(_ child: Coordinator) {
        removeChildCoordinator(child: child)
    }
    
    func showCreate() {
        let coordinator = CreateCoordinator(self.navigationController)
        coordinator.delegate = self
        self.addChildCoordinator(child: coordinator)
        coordinator.start()
    }
}

extension HomeCoordinator: ShareCoordinatorDeleagate {
    func closeShare() {
        print("navigationController: \(navigationController.viewControllers)")
        print("childCoordinator: \(childCoordinators)")
    }
    
    func didFinishShare(_ child: Coordinator) {
        removeChildCoordinator(child: child)
    }
    
    func showShare() {
        let coordinator = ShareCoordinator(self.navigationController)
        coordinator.delegate = self
        self.addChildCoordinator(child: coordinator)
        coordinator.start()
    }
}
