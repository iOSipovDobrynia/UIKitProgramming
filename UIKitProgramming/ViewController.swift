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
    private let switchLabel = UILabel()
    private let doneButton = UIButton()
    
    private let stackView = UIStackView()
    private let switchStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Actions
    @objc
    private func segmetnedControlAction() {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            mainLabel.text = "FIRST!!!"
        case 1:
            mainLabel.text = "Second"
        default:
            mainLabel.text = "Default Label"
        }
    }
    
    @objc
    private func sliderAction() {
        mainLabel.text = String(format: "%.2f", slider.value)
    }
    
    @objc
    private func doneButtonAction() {
        guard let inputText = textField.text, !inputText.isEmpty else {
            showAlert(with: "Error", and: "Enter your age")
            return
        }
        guard let age = Int(inputText) else {
            showAlert(with: "Error", and: "Age must be integer")
            return
        }
        
        mainLabel.text = age.formatted()
    }
    
    @objc
    private func switchAction() {
        datePicker.isHidden.toggle()
    }
    
    @objc
    private func datePickerAction() {
        mainLabel.text = datePicker.date.formatted(
            date: .omitted,
            time: .complete
        )
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
        setupSwitchStackView()
        setupStackView()
        addSubViews()
        setupLayout()
        addActions()
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
            doneButton,
            switchStackView,
            datePicker
        ].forEach { subView in
            stackView.addArrangedSubview(subView)
        }
    }
    
    func setupSwitchStackView() {
        switchStackView.axis = .horizontal
        switchStackView.distribution = .fill
        stackView.spacing = 0
        
        [
            switchLabel,
            switcher
        ].forEach { subView in
            switchStackView.addArrangedSubview(subView)
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
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .time
    }
    
    func setupSwitch() {
        switchLabel.text = "Show date picker"
        switchLabel.font = UIFont.systemFont(ofSize: 20)
        switcher.setOn(true, animated: false)
    }
    
    func setupDoneButton() {
        doneButton.setTitle("Done", for: .normal)
        doneButton.tintColor = .magenta
        doneButton.setTitleColor(.magenta, for: .normal)
    }
    
    func addActions() {
        segmentedControl.addTarget(
            self,
            action: #selector(segmetnedControlAction),
            for: .valueChanged
        )
        slider.addTarget(
            self,
            action: #selector(sliderAction),
            for: .valueChanged
        )
        doneButton.addTarget(
            self,
            action: #selector(doneButtonAction),
            for: .touchUpInside
        )
        switcher.addTarget(
            self,
            action: #selector(switchAction),
            for: .valueChanged
        )
        datePicker.addTarget(
            self,
            action: #selector(datePickerAction),
            for: .valueChanged)
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
            switchLabel,
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

// MARK: - UIAlertController
extension ViewController {
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(
            title: "OK",
            style: .default
        ) { _ in self.textField.text = "" }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
