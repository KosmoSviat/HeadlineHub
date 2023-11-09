//
//  TabBarController.swift
//  HeadlineHub
//
//  Created by Sviatoslav Samoilov on 7.08.2023.
//

import UIKit

final class TabBarController: UITabBarController {
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
        view.tintColor = .black
    }
    
    // MARK: - Methods
    private func setupViewControllers() {
        viewControllers = [
            setupNavigationController(rootViewController: GeneralViewController(viewModel: GeneralViewModel()),
                                      title: "General", image: UIImage(systemName: "newspaper") ?? UIImage.add),
            setupNavigationController(rootViewController: BusinessViewController(viewModel: BusinessViewModel()),
                                      title: "Business", image: UIImage(systemName: "briefcase") ?? UIImage.add)
//            setupNavigationController(rootViewController: TechnologyViewController()
//                                      ,title: "Technology", image: UIImage(systemName: "gyroscope") ?? UIImage.add)
        ]
    }
    
    private func setupNavigationController(rootViewController: UIViewController, title: String, image: UIImage) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: rootViewController)
        rootViewController.navigationItem.title = title
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = image
        return navigationController
    }
}
