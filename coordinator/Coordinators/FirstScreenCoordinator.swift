//
//  FirstScreenCoordinator.swift
//  coordinator
//
//  Created by Alessandro Comparini on 16/08/23.
//

import UIKit

class FirstScreenCoordinator: Coordinator {
    var childCoordinators: [Coordinator]? = []
    
    var navigationController: NavigationController
    
    required init(_ navigationController: NavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        childCoordinators?.append(self)
        if !validatorFactory().validate() {
            return
        }
        startFirstViewController()
    }
    
    
//  MARK: - PRIVATE AREA
    private func validatorFactory() -> Validator {
        defaultValidatorFactory(ofTypeViewController: FirstViewController(),
                                                navigationController: navigationController,
                                                coordinator: self)
    }
    
    private func startFirstViewController() {
        let thirdViewController = FirstViewController()
        thirdViewController.coordinator = self
        navigationController.pushViewController(thirdViewController, animated: true)
    }
    
}


//  MARK: - EXTENSION FirstViewControllerCoordinator

extension FirstScreenCoordinator: FirstViewControllerCoordinator {
    func goToSecondScreen() {
        let coordinator = SecondScreenCoordinator(navigationController)
        coordinator.start()
        childCoordinators = nil
    }

    func goToThirdScreen() {
        let coordinator = ThirdScreenCoordinator(navigationController)
        coordinator.start()
        childCoordinators = nil
    }
}
