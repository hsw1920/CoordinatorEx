//
//  ShareCoordinator.swift
//  ExCoordinator
//
//  Created by 홍승완 on 2024/02/08.
//

import UIKit

protocol ShareCoordinatorDeleagate {
    func didFinishShare(_ child: Coordinator)
    func closeShare()
}

final class ShareCoordinator: Coordinator {

    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var delegate: ShareCoordinatorDeleagate?
    
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    deinit {
        print("- \(type(of: self)) deinit")
    }
    
    func start() {
        let vc = ShareVC()
        vc.coordinator = self
        self.navigationController.popToRootViewController(animated: false)
        self.navigationController.pushViewController(vc, animated: true)
    }
    
}

extension ShareCoordinator: ShareVCDelegate {
    func didFinishShare() {
        delegate?.didFinishShare(self)
    }
    
    func closeShare() {
        delegate?.closeShare()
    }
}

