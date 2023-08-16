//
//  SecondViewController.swift
//  coordinator
//
//  Created by Alessandro Comparini on 16/08/23.
//

import UIKit

protocol SecondViewControllerCoordinator: AnyObject {
    func goToFirstScreen()
    func goToThirdScreen()
}

class SecondViewController: UIViewController {
    weak var coordinator: SecondViewControllerCoordinator?
    
    lazy var screen: SecondView = {
        let view = SecondView()
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
extension SecondViewController: SecondViewDelegate {
    func goToFirstButtonTapped() {
        coordinator?.goToFirstScreen()
    }
    
    func goToThirdButtonTapped() {
        coordinator?.goToThirdScreen()
    }
    
}

