//
//  ShareCoordinator.swift
//  ExCoordinator
//
//  Created by 홍승완 on 2024/02/08.
//

import UIKit

protocol ShareCoordinatorDeleagate {
    func didFinishShare(_ child: Coordinator)
}

enum FlowType {
    case create
    case history
}

final class ShareCoordinator: Coordinator {

    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var delegate: ShareCoordinatorDeleagate?
    var sourceFlow: FlowType!
    
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    init(navigationController: UINavigationController, sourceFlow: FlowType) {
        self.navigationController = navigationController
        self.sourceFlow = sourceFlow
    }
    
    deinit {
        print("- \(type(of: self)) deinit")
    }
    
    func start() {
        guard let rootVC = self.navigationController.viewControllers.first,
              rootVC is HomeVC else {
            return
        }
        
        switch sourceFlow {
        case .create:
            let shareVC = ShareVC(buttonType: .closeShare)
            shareVC.coordinator = self
            self.navigationController.pushViewController(shareVC, animated: true)
            self.navigationController.viewControllers = [rootVC, shareVC]
        case .history:
            let shareVC = ShareVC(buttonType: .back)
            shareVC.coordinator = self
            self.navigationController.pushViewController(shareVC, animated: true)
        case .none:
            return
        }
    }
    
    func finish() {
        childCoordinators.removeAll()
        delegate?.didFinishShare(self)
    }
}

extension ShareCoordinator: ShareVCDelegate {
    func didFinishShare() {
        dismissShare()
        finish()
    }
    
    func dismissShare() {
        switch sourceFlow {
        case .create:
            self.navigationController.popToRootViewController(animated: true)
        case .history:
            self.navigationController.popViewController(animated: true)
        case .none:
            return
        }
    }
}

