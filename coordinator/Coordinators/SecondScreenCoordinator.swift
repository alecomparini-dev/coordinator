//
//  SecondScreenCoordinator.swift
//  coordinator
//
//  Created by Alessandro Comparini on 16/08/23.
//

import UIKit

class SecondScreenCoordinator: Coordinator {
    var controlCoordinator: Coordinator?

    var navigationController: NavigationController
    
    required init(_ navigationController: NavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        controlCoordinator = self
        let secondViewController = SecondViewController()
        secondViewController.coordinator = self
        if let vc = navigationController.containsViewController(ofType: SecondViewController.self) as? SecondViewController {
            vc.coordinator = self
            navigationController.popToViewController(vc, animated: true)
            return
        }
        navigationController.pushViewController(secondViewController, animated: true)
    }
    
}


//  MARK: - EXTENSION SecondViewControllerCoordinator

extension SecondScreenCoordinator: SecondViewControllerCoordinator {
    func goToFirstScreen() {
        controlCoordinator = nil
        let coordinator = FirstScreenCoordinator(navigationController)
        coordinator.start()
    }
    
    func goToThirdScreen() {
        controlCoordinator = nil
        let coordinator = ThirdScreenCoordinator(navigationController)
        coordinator.start()
    }
}
