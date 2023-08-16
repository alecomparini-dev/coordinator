//
//  FirstScreenCoordinator.swift
//  coordinator
//
//  Created by Alessandro Comparini on 16/08/23.
//

import UIKit

class FirstScreenCoordinator: Coordinator {
    var controlCoordinator: Coordinator?
    
    var navigationController: NavigationController
    
    required init(_ navigationController: NavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        controlCoordinator = self
        let firstViewController = FirstViewController()
        firstViewController.coordinator = self
        if let vc = navigationController.containsViewController(ofType: FirstViewController.self) as? FirstViewController {
            vc.coordinator = self
            navigationController.popToViewController(vc, animated: true)
            return
        }
        navigationController.pushViewController(firstViewController, animated: true)
    }
    
}


//  MARK: - EXTENSION FirstViewControllerCoordinator

extension FirstScreenCoordinator: FirstViewControllerCoordinator {
    func goToSecondScreen() {
        controlCoordinator = nil
        let coordinator = SecondScreenCoordinator(navigationController)
        coordinator.start()
    }

    func goToThirdScreen() {
        controlCoordinator = nil
        let coordinator = ThirdScreenCoordinator(navigationController)
        coordinator.start()
    }
}
