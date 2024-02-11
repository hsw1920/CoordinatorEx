//
//  UIViewController+Utils.swift
//  ExCoordinator
//
//  Created by 홍승완 on 2024/02/10.
//

import UIKit

enum ButtonType {
    case closeCreate
    case closeShare
    case backToShare
    case back
    
    var iconSystemName: String {
        switch self {
        case .closeCreate, .closeShare:
            return "xmark"
        case .backToShare:
            return "newspaper"
        case .back:
            return "arrow.left"
        }
    }
}

extension UIViewController {
    func setupNavigationItem(with buttonType: ButtonType, target: Any?, action: Selector?) {
        let button = UIBarButtonItem(
            image: UIImage(
                systemName: buttonType.iconSystemName,
                withConfiguration: UIImage.SymbolConfiguration(pointSize: 18, weight: .semibold)
            ),
            style: .plain,
            target: target,
            action: action
        )
        
        switch buttonType {
        case .closeCreate, .backToShare:
            navigationItem.rightBarButtonItem = button
        case .closeShare:
            navigationItem.setHidesBackButton(true, animated: true)
            navigationItem.rightBarButtonItem = button
        case .back:
            navigationItem.leftBarButtonItem = button
        }
    }
}
