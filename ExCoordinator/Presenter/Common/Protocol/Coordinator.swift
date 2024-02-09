//
//  Coordinator.swift
//  ExCoordinator
//
//  Created by 홍승완 on 2024/02/03.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    init(_ navigationController: UINavigationController)
    
    func start()
}

extension Coordinator {
    func addChildCoordinator(child: Coordinator) {
        childCoordinators.append(child)
    }
    
    func removeChildCoordinator(child: Coordinator) {
        childCoordinators = childCoordinators.filter { $0.self !== child.self }
    }
}
