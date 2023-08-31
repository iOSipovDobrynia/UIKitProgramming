//
//  ViewController.swift
//  UIKitProgramming
//
//  Created by Goodwasp on 30.08.2023.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Private prop
    private var segmentedControl = UISegmentedControl()
    private let mainLabel = UILabel()
    private let slider = UISlider()
    private let textField = UITextField()
    private let datePicker = UIDatePicker()
    private let switcher = UISwitch()
    private let doneButton = UIButton()
    
    private let stackView = UIStackView()
    
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
        setupDatePicker()
        setupSwitch()
        setupDoneButton()
        setupStackView()
        addSubViews()
        setupLayout()
    }
}

// MARK: - Settings
private extension ViewController {
    func addSubViews() {
        [
            stackView
        ].forEach { subView in
            view.addSubview(subView)
        }
    }
    
    func setupStackView() {
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 50
        
        [
            segmentedControl,
            mainLabel,
            slider,
            textField,
            datePicker,
            switcher,
            doneButton
        ].forEach { subView in
            stackView.addArrangedSubview(subView)
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

        textField.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func setupDatePicker() {
        
    }
    
    func setupSwitch() {
        
    }
    
    func setupDoneButton() {
        doneButton.setTitle("Done", for: .normal)
        doneButton.tintColor = .magenta
        doneButton.setTitleColor(.magenta, for: .normal)
    }
}

// MARK: - Layout
private extension ViewController {
    func setupLayout() {
        [
            stackView,
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
            stackView.topAnchor.constraint(
                equalTo: view.topAnchor,
                constant: 60
            ),
            stackView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -16
            ),
            stackView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 16
            )
        ])
    }
}
