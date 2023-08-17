//
//  SecondScreenCoordinator.swift
//  coordinator
//
//  Created by Alessandro Comparini on 16/08/23.
//

import UIKit

class SecondScreenCoordinator: Coordinator {
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
        startSecondViewController()
    }
    
//  MARK: - PRIVATE AREA
    private func validatorFactory() -> Validator {
        defaultValidatorFactory(ofTypeViewController: SecondViewController(),
                                                navigationController: navigationController,
                                                coordinator: self)
    }
    
    private func startSecondViewController() {
        let thirdViewController = SecondViewController()
        thirdViewController.coordinator = self
        navigationController.pushViewController(thirdViewController, animated: true)
    }
    
}


//  MARK: - EXTENSION SecondViewControllerCoordinator

extension SecondScreenCoordinator: SecondViewControllerCoordinator {
    func goToFirstScreen() {
        let coordinator = FirstScreenCoordinator(navigationController)
        coordinator.start()
        childCoordinators = nil
    }
    
    func goToThirdScreen() {
        let coordinator = ThirdScreenCoordinator(navigationController)
        coordinator.start()
        childCoordinators = nil
    }
}
