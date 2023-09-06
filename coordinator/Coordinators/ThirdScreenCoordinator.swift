//
//  ThirdScreenCoordinator.swift
//  coordinator
//
//  Created by Alessandro Comparini on 16/08/23.
//

import UIKit

class ThirdScreenCoordinator: Coordinator {
    var childCoordinator: Coordinator?
    
    var navigationController: NavigationController
    
    required init(_ navigationController: NavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        childCoordinator = self
        var controller = ThirdViewController()
        controller = navigationController.pushViewController(controller)
        controller.coordinator = self
    }
    
}


//  MARK: - EXTENSION ThirdViewControllerCoordinator

extension ThirdScreenCoordinator: ThirdViewControllerCoordinator {
    func goToFirstScreen() {
        let coordinator = FirstScreenCoordinator(navigationController)
        coordinator.start()
        childCoordinator = nil
    }

    func goToSecondScreen() {
        let coordinator = SecondScreenCoordinator(navigationController)
        coordinator.start()
        childCoordinator = nil
    }
}
