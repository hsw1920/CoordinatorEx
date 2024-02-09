//
//  LoginCoordinator.swift
//  ExCoordinator
//
//  Created by 홍승완 on 2024/02/03.
//

import UIKit

enum CreateViewType {
    case CSInfo
    case CSMember
    case CSItem
}

protocol CreateCoordinatorDelegate {
    func didFinishCreate(_ child: Coordinator)
    func showShare()
}

final class CreateCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var delegate: CreateCoordinatorDelegate?
    
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    deinit {
        print("- \(type(of: self)) deinit")
    }
    
    func start() {
        let vc = SplitMethodVC()
        vc.coordinator = self
        self.navigationController.pushViewController(vc, animated: true)
    }
    
    func didFinishCreate() {
        childCoordinators.removeAll()
        delegate?.didFinishCreate(self)
    }
    
    func didFinishCreate(_ child: Coordinator) {
        delegate?.didFinishCreate(self)
        removeChildCoordinator(child: child)
    }
}

extension CreateCoordinator: SplitMethodVCDelegate {
    func showNextViewSmart() {
        let coordinator = SmartCoordinator(self.navigationController)
        coordinator.delegate = self
        self.addChildCoordinator(child: coordinator)
        coordinator.start()
    }
    
    func showNextViewEqual() {
        let coordinator = EqualCoordinator(self.navigationController)
        coordinator.delegate = self
        self.addChildCoordinator(child: coordinator)
        coordinator.start()
    }
}

extension CreateCoordinator: SmartCoordinatorDelegate, EqualCoordinatorDelegate {
    func didFinishSmart(_ child: Coordinator) {
        removeChildCoordinator(child: child)
    }
    
    func didFinishEqual(_ child: Coordinator) {
        removeChildCoordinator(child: child)
    }
    
    func showShareVC(child: Coordinator) {
        delegate?.didFinishCreate(self)
        delegate?.showShare()
    }
}
