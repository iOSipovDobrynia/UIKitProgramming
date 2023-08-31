//
//  ViewController.swift
//  UIKitProgramming
//
//  Created by Goodwasp on 30.08.2023.
//

import UIKit

class ViewController: UIViewController {

    private var segmentedControl = UISegmentedControl()
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
        view.backgroundColor = .white
        setupSegmentedControl()
        setupMainLabel()
        setupSlider()
        setupTextField()
        addSubViews()
        setupLayout()
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
    
    func setupSegmentedControl() {
        let items = ["First", "Second"]
        segmentedControl = UISegmentedControl(items: items)
    }
    
    func setupMainLabel() {
        mainLabel.text = String(slider.value)
        mainLabel.font = UIFont.systemFont(ofSize: 25)
        mainLabel.textAlignment = .center
        mainLabel.numberOfLines = 0
    }
    
    func setupSlider() {
        slider.minimumValue = 0
        slider.value = 50
        slider.maximumValue = 100
        slider.minimumTrackTintColor = .cyan
        slider.maximumTrackTintColor = .brown
        slider.thumbTintColor = .black
    }
    
    func setupTextField() {
        textField.placeholder = "Enter your age"
        textField.tintColor = .red
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = UIColor.green.cgColor
        textField.layer.borderWidth = 1
    }
}

// MARK: - Layout
private extension ViewController {
    func setupLayout() {
        [
            segmentedControl,
            mainLabel,
            slider,
            textField,
            datePicker,
            switcher,
            doneButton
        ].forEach { subView in
            subView.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(
                equalTo: view.topAnchor,
                constant: 60
            ),
            segmentedControl.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -16
            ),
            segmentedControl.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 16
            ),
            mainLabel.topAnchor.constraint(
                equalTo: segmentedControl.bottomAnchor,
                constant: 30
            ),
            mainLabel.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -16
            ),
            mainLabel.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 16
            ),
            slider.topAnchor.constraint(
                equalTo: mainLabel.bottomAnchor,
                constant: 30
            ),
            slider.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -16
            ),
            slider.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 16
            ),
            textField.topAnchor.constraint(
                equalTo: slider.bottomAnchor,
                constant: 30
            ),
            textField.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -16
            ),
            textField.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 16
            )
        ])
    }
}
