//
//  ViewController.swift
//  UIKitProgramming
//
//  Created by Goodwasp on 30.08.2023.
//

import UIKit

class ViewController: UIViewController {

    private let segmentedControl = UISegmentedControl()
    private let mainLabel = UILabel()
    private let slider = UISlider()
    private let textField = UITextField()
    private let datePicker = UIDatePicker()
    private let switcher = UISwitch()
    private let doneButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

// MARK: - Settings View
private extension ViewController {
    func setupView() {
        view.backgroundColor = .blue
        
    }
}

// MARK: - Settings
private extension ViewController {
    func addSubViews() {
        [
            segmentedControl,
            mainLabel,
            slider,
            textField,
            datePicker,
            switcher,
            doneButton
        ].forEach { subView in
            view.addSubview(subView)
        }
    }
}

// MARK: - Layout
private extension ViewController {
    func setupLayout() {
        
    }
}
