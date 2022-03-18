//
//  ViewController.swift
//  Sandbox
//
//  Created by Samuel Brehm on 17/03/22.
//

import UIKit
import ComponentsUI

class ViewController: UIViewController {
    
    
    @IBOutlet private weak var componentContainerView: UIView!
    @IBOutlet private weak var titleTextField: UITextField!
    @IBOutlet private weak var contentTextField: UITextField!
    @IBOutlet private weak var favoriteSwitch: UISwitch!
    @IBOutlet private weak var loadingSwitch: UISwitch!
    
    private var timer = Timer()
    
    private lazy var cardComponent: CardComponent = {
        let component: CardComponent = UIView.componentFromNib()
        component.delegate = self
        return component
    }()
    
    private var componentDTO: CardComponent.DTO {
        return .init(title: titleTextField.text ?? "",
                     content: contentTextField.text ?? "",
                     isFavorite: favoriteSwitch.isOn)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
        cardComponent.pinToBounds(of: componentContainerView)
        cardComponent.render(.loading(loadingSwitch.isOn))
        timer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false, block: { _ in
            self.loadingSwitch.isOn = false
            self.cardComponent.render(.loading(self.loadingSwitch.isOn))
            self.cardComponent.render(.build(self.componentDTO))
        })
    }
    
    
    @IBAction func didTapRender(_ sender: UIButton) {
        cardComponent.render(.build(componentDTO))
    }
    
    @IBAction func didSwitchFavorite(_ sender: UISwitch) {
        cardComponent.render(.favorite(self.favoriteSwitch.isOn))
    }
    
    @IBAction func didSwitchLoading(_ sender: UISwitch) {
        cardComponent.render(.loading(self.loadingSwitch.isOn))
    }
    
    
}

extension ViewController: CardComponentDelegate {
    func cardComponentDidTapFavoriteButton(_ component: CardComponent) {
        favoriteSwitch.isOn = !favoriteSwitch.isOn
        component.render(.favorite(favoriteSwitch.isOn))
    }
}

extension UIView {
    
    func pinToBounds(of view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(self)
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: view.leadingAnchor),
            trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topAnchor.constraint(equalTo: view.topAnchor),
            bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
