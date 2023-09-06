//
//  ThirdViewController.swift
//  coordinator
//
//  Created by Alessandro Comparini on 16/08/23.
//

import UIKit

protocol ThirdViewControllerCoordinator: AnyObject {
    func goToFirstScreen()
    func goToSecondScreen()
}

class ThirdViewController: UIViewController, ViewControllerCoordinator {
    weak var coordinator: ThirdViewControllerCoordinator?
    
    lazy var screen: ThirdView = {
        let view = ThirdView()
        return view
    }()
    
    override func loadView() {
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configDelegate()
    }

    
//  MARK: - PRIVATE AREA
    private func configDelegate() {
        screen.delegate = self
    }
    
}


//  MARK: - EXTENSION FirstViewDelegate
extension ThirdViewController: ThirdViewDelegate {
    func goToFirstButtonTapped() {
        coordinator?.goToFirstScreen()
    }
    
    func goToSecondButtonTapped() {
        coordinator?.goToSecondScreen()
    }
    
}

