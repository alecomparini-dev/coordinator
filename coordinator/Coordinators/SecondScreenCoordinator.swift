//
//  SecondScreenCoordinator.swift
//  coordinator
//
//  Created by Alessandro Comparini on 16/08/23.
//

import UIKit

class SecondScreenCoordinator: Coordinator {
    var childCoordinator: Coordinator?

    var navigationController: NavigationController
    
    required init(_ navigationController: NavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        childCoordinator = self
        var controller = SecondViewController()
        controller = navigationController.pushViewController(controller)
        controller.coordinator = self
    }
    
}


//  MARK: - EXTENSION SecondViewControllerCoordinator

extension SecondScreenCoordinator: SecondViewControllerCoordinator {
    func goToFirstScreen() {
        let coordinator = FirstScreenCoordinator(navigationController)
        coordinator.start()
        childCoordinator = nil
    }
    
    func goToThirdScreen() {
        let coordinator = ThirdScreenCoordinator(navigationController)
        coordinator.start()
        childCoordinator = nil
    }
}
