//
//  AppCoordinator.swift
//  ExCoordinator
//
//  Created by 홍승완 on 2024/02/03.
//

import Foundation
import UIKit

final class AppCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []

    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        startHomeFlow()
    }

    func startHomeFlow() {
        let coordinator = HomeCoordinator(self.navigationController)
        coordinator.delegate = self
        self.addChildCoordinator(child: coordinator)
        coordinator.start()
    }
}

extension AppCoordinator: HomeCoordinatorDeleagate {
    func didFinishHome(_ child: Coordinator) {
        removeChildCoordinator(child: child)
    }
}
