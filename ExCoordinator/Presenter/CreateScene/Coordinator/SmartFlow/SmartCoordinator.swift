//
//  SmartCoordinator.swift
//  ExCoordinator
//
//  Created by 홍승완 on 2024/02/07.
//

import UIKit

protocol SmartCoordinatorDelegate {
    func didFinishCreate(_ child: Coordinator)
    func didFinishSmart(_ child: Coordinator)
    func showShareVC(child: Coordinator)
}

final class SmartCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var delegate: SmartCoordinatorDelegate?
    
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    deinit {
        print("- \(type(of: self)) deinit")
    }
    
    func start() {
        let vc = CSInfoVC()
        vc.coordinator = self
        self.navigationController.pushViewController(vc, animated: true)
    }
    
    func finish() {
        childCoordinators.removeAll()
        delegate?.didFinishSmart(self)
    }

}

extension SmartCoordinator: CSInfoVCDelegate, CSMemberVCDelegate, CSItemVCDelegate {
    func popBack() {
        navigationController.popViewController(animated: true)
        
        let isFinishEqualFlow = navigationController.viewControllers
                .compactMap { $0 as? HomeVC ?? $0 as? SplitMethodVC }
                .count == navigationController.viewControllers.count
        
        if isFinishEqualFlow {
            finish()
        }
    }
    
    func didFinishCreate() {
        // Exit 버튼 눌렀을 때
        navigationController.popToRootViewController(animated: true)
        finish()
        delegate?.didFinishCreate(self)
    }

    func showNextView(viewType: CreateViewType) {
        switch viewType {
        case .CSInfo:
            let vc = CSMemberVC()
            vc.coordinator = self
            self.navigationController.pushViewController(vc, animated: true)
        case .CSMember:
            let vc = CSItemVC()
            vc.coordinator = self
            self.navigationController.pushViewController(vc, animated: true)
        case .CSItem:
            finish()
            delegate?.showShareVC(child: self)
        }
    }
}
