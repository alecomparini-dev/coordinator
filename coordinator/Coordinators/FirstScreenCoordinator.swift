//
//  FirstScreenCoordinator.swift
//  coordinator
//
//  Created by Alessandro Comparini on 16/08/23.
//

import UIKit

class FirstScreenCoordinator: Coordinator {
    var childCoordinator: Coordinator?
    
    var navigationController: NavigationController
    
    required init(_ navigationController: NavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        childCoordinator = self
        var controller = FirstViewController()
        controller = navigationController.pushViewController(controller)
        controller.coordinator = self
    }
    

}


//  MARK: - EXTENSION FirstViewControllerCoordinator

extension FirstScreenCoordinator: FirstViewControllerCoordinator {
    func goToSecondScreen() {
        let coordinator = SecondScreenCoordinator(navigationController)
        coordinator.start()
        childCoordinator = nil
    }

    func goToThirdScreen() {
        let coordinator = ThirdScreenCoordinator(navigationController)
        coordinator.start()
        childCoordinator = nil
    }
}
