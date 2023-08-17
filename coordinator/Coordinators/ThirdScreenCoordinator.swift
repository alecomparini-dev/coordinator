//
//  ThirdScreenCoordinator.swift
//  coordinator
//
//  Created by Alessandro Comparini on 16/08/23.
//

import UIKit

class ThirdScreenCoordinator: Coordinator {
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
        startThirdViewController()
    }
    
//  MARK: - PRIVATE AREA
    private func validatorFactory() -> Validator {
        defaultValidatorFactory(ofTypeViewController: ThirdViewController(),
                                                navigationController: navigationController,
                                                coordinator: self)
    }
    
    private func startThirdViewController() {
        let thirdViewController = ThirdViewController()
        thirdViewController.coordinator = self
        navigationController.pushViewController(thirdViewController, animated: true)
    }

}


//  MARK: - EXTENSION ThirdViewControllerCoordinator

extension ThirdScreenCoordinator: ThirdViewControllerCoordinator {
    func goToFirstScreen() {
        let coordinator = FirstScreenCoordinator(navigationController)
        coordinator.start()
        childCoordinators = nil
    }

    func goToSecondScreen() {
        let coordinator = SecondScreenCoordinator(navigationController)
        coordinator.start()
        childCoordinators = nil
    }
}
