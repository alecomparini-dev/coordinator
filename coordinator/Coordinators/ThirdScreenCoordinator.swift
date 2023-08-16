//
//  ThirdScreenCoordinator.swift
//  coordinator
//
//  Created by Alessandro Comparini on 16/08/23.
//

import UIKit

class ThirdScreenCoordinator: Coordinator {
    var controlCoordinator: Coordinator?
    
    var navigationController: NavigationController
    
    required init(_ navigationController: NavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        controlCoordinator = self
        let thirdViewController = ThirdViewController()
        thirdViewController.coordinator = self
        if let vc = navigationController.containsViewController(ofType: ThirdViewController.self) as? ThirdViewController {
            vc.coordinator = self
            navigationController.popToViewController(vc, animated: true)
            return
        }
        navigationController.pushViewController(thirdViewController, animated: true)
    }

}

extension ThirdScreenCoordinator: ThirdViewControllerCoordinator {
    func goToFirstScreen() {
        controlCoordinator = nil
        let coordinator = FirstScreenCoordinator(navigationController)
        coordinator.start()
    }

    func goToSecondScreen() {
        controlCoordinator = nil
        let coordinator = SecondScreenCoordinator(navigationController)
        coordinator.start()
    }
}
