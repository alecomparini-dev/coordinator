//
//  FirstViewController.swift
//  coordinator
//
//  Created by Alessandro Comparini on 16/08/23.
//

import UIKit

protocol FirstViewControllerCoordinator: AnyObject {
    func goToSecondScreen()
    func goToThirdScreen()
}

class FirstViewController: UIViewController, ViewControllerCoordinator {
    weak var coordinator: FirstViewControllerCoordinator?
    
    lazy var screen: FirstView = {
        let view = FirstView()
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
extension FirstViewController: FirstViewDelegate {
    func goToSecondButtonTapped() {
        coordinator?.goToSecondScreen()
    }
    
    func goToThirdButtonTapped() {
        coordinator?.goToThirdScreen()
    }
    
}

