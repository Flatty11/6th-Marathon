//
//  ViewController.swift
//  6th Marathon
//
//  Created by Илья on 7/18/23.
//

import UIKit

class ViewController: UIViewController {

    var squareView: UIView!
    var animator: UIDynamicAnimator!
    var snapBehavior: UISnapBehavior!
    var rotationBehavior: UIDynamicItemBehavior!

    override func viewDidLoad() {
        super.viewDidLoad()

        squareView = UIView(frame: CGRect(x: 40, y: 100, width: 100, height: 100))
        squareView.backgroundColor = .systemIndigo
        squareView.layer.cornerRadius = 8
        view.addSubview(squareView)

        animator = UIDynamicAnimator(referenceView: view)
        rotationBehavior = UIDynamicItemBehavior(items: [squareView])
        rotationBehavior.angularResistance = 0.1
        animator.addBehavior(rotationBehavior)

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        view.addGestureRecognizer(tapGesture)
    }

    @objc func handleTap(_ gesture: UITapGestureRecognizer) {
        let tapPoint = gesture.location(in: view)

        if snapBehavior != nil {
            animator.removeBehavior(snapBehavior)
        }

        // Перемещаем квадрат в точку нажатия
        snapBehavior = UISnapBehavior(item: squareView, snapTo: tapPoint)
        animator.addBehavior(snapBehavior)

        // Добавляем небольшой поворот квадрата
        let angle = 0.1
        rotationBehavior.addAngularVelocity(angle, for: squareView)
    }
}
