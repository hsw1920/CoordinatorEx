//
//  EqualCoordinator.swift
//  ExCoordinator
//
//  Created by 홍승완 on 2024/02/07.
//

import UIKit

protocol EqualCoordinatorDelegate {
    func didFinishCreate(_ child: Coordinator)
    func didFinishEqual(_ child: Coordinator)
    func showShareVC(child: Coordinator)
}

final class EqualCoordinator: Coordinator {

    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var delegate: EqualCoordinatorDelegate?
    
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
        delegate?.didFinishEqual(self)
    }

}

extension EqualCoordinator: CSInfoVCDelegate, CSMemberVCDelegate {
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
        finish()
        delegate?.didFinishCreate(self)
        navigationController.popToRootViewController(animated: true)
    }
    
    func showNextView(viewType: CreateViewType) {
        switch viewType {
        case .CSInfo:
            let vc = CSMemberVC()
            vc.coordinator = self
            self.navigationController.pushViewController(vc, animated: true)
        case .CSMember:
            finish()
            delegate?.showShareVC(child: self)
        default:
            break
        }
    }
}
