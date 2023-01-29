//
//  ViewController.swift
//  Calculator layout (programmatically)
//
//  Created by Eduard Tokarev on 29.01.2023.
//

import UIKit

class ViewController: UIViewController {
    let mainStackView = UIStackView()
    let stackViewToFunctionButtons = UIStackView()
    let stackViewFor789 = UIStackView()
    let stackViewFor456 = UIStackView()
    let stackViewFor123 = UIStackView()
    let stackViewFor0 = UIStackView()
    let stackViewBottom = UIStackView()
    
    let label = UILabel()
    let viewLabel = UILabel()
    
    let buttonPercent = UIButton()
    let buttonPlusOrMinus = UIButton()
    let buttonAC = UIButton()
    
    let buttonDivision = UIButton()
    let buttonMultiply = UIButton()
    let buttonMinus = UIButton()
    let buttonPlus = UIButton()
    let buttonEquals = UIButton()
    
    let buttonZero = UIButton()
    let buttonOne = UIButton()
    let buttonTwo = UIButton()
    let buttonThree = UIButton()
    let buttonFor = UIButton()
    let buttonFive = UIButton()
    let buttonSix = UIButton()
    let buttonSeven = UIButton()
    let buttonEight = UIButton()
    let buttonNine = UIButton()
    
    let buttonDot = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        applyStyle()
        applyLayout()
    }
    
    func applyStyle() {
        label.text = "0"
        label.font = .systemFont(ofSize: 50, weight: .thin)
        label.textColor = .white
        label.textAlignment = .right
        
        applyStyleToFunctionButtons(buttonPercent, title: "%")
        applyStyleToFunctionButtons(buttonPlusOrMinus, title: "+/-")
        applyStyleToFunctionButtons(buttonAC, title: "AC")
        
        applyStyleToOperationSigns(buttonDivision, title: "÷")
        applyStyleToOperationSigns(buttonMultiply, title: "x")
        applyStyleToOperationSigns(buttonMinus, title: "-")
        applyStyleToOperationSigns(buttonPlus, title: "+")
        applyStyleToOperationSigns(buttonEquals, title: "=", font: .systemFont(ofSize: 30, weight: .bold))
        
        applyStyleToNumberButtons(buttonZero, title: "0")
        applyStyleToNumberButtons(buttonOne, title: "1")
        applyStyleToNumberButtons(buttonTwo, title: "2")
        applyStyleToNumberButtons(buttonThree, title: "3")
        applyStyleToNumberButtons(buttonFor, title: "4")
        applyStyleToNumberButtons(buttonFive, title: "5")
        applyStyleToNumberButtons(buttonSix, title: "6")
        applyStyleToNumberButtons(buttonSeven, title: "7")
        applyStyleToNumberButtons(buttonEight, title: "8")
        applyStyleToNumberButtons(buttonNine, title: "9")
        
        applyStyleToNumberButtons(buttonDot, title: ".", font: .systemFont(ofSize: 30, weight: .bold))
        
        view.backgroundColor = .black
    }
    
    func applyLayout() {
        view.addSubview(mainStackView)
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        
        viewLabel.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        arrangeStackView(
            mainStackView,
            subviews: [
                viewLabel,
                stackViewToFunctionButtons,
                stackViewFor789,
                stackViewFor456,
                stackViewFor123,
                stackViewFor0
            ],
            axis: .vertical
        )
        
        arrangeStackView(
            stackViewToFunctionButtons,
            subviews: [
                buttonPercent,
                buttonPlusOrMinus,
                buttonAC,
                buttonDivision
            ])
        
        arrangeStackView(
            stackViewFor789,
            subviews: [
                buttonSeven,
                buttonEight,
                buttonNine,
                buttonMultiply
            ])
        
        arrangeStackView(
            stackViewFor456,
            subviews: [
                buttonFor,
                buttonFive,
                buttonSix,
                buttonMinus
            ])
        
        arrangeStackView(
            stackViewFor123,
            subviews: [
                buttonOne,
                buttonTwo,
                buttonThree,
                buttonPlus
            ])
        
        arrangeStackView(
            stackViewFor0,
            subviews: [
                buttonZero,
                stackViewBottom
            ])
        
        arrangeStackView(
            stackViewBottom,
            subviews: [
                buttonDot,
                buttonEquals
            ])
        
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            label.topAnchor.constraint(equalTo: viewLabel.topAnchor),
            label.trailingAnchor.constraint(equalTo: viewLabel.trailingAnchor, constant: -20),
            label.leadingAnchor.constraint(equalTo: viewLabel.leadingAnchor, constant: 20),
            label.bottomAnchor.constraint(equalTo: viewLabel.bottomAnchor)
        ])
    }
    
    func arrangeStackView(
        _ stackView: UIStackView,
        subviews: [UIView],
        spacing: CGFloat = 1,
        axis: NSLayoutConstraint.Axis = .horizontal,
        distribution: UIStackView.Distribution = .fillEqually,
        alignment: UIStackView.Alignment = .fill
    ) {
        stackView.axis = axis
        stackView.spacing = spacing
        stackView.distribution = distribution
        stackView.alignment = alignment
        
        subviews.forEach { item in
            item.translatesAutoresizingMaskIntoConstraints = false
            stackView.addArrangedSubview(item)
        }
    }
    
    func applyStyleToNumberButtons(
        _ button: UIButton,
        title: String,
        font: UIFont = .systemFont(ofSize: 30, weight: .regular)
    ){
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = font
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.1244815961, green: 0.6773787737, blue: 0.9726050496, alpha: 1)
    }
    
    func applyStyleToOperationSigns(
        _ button: UIButton,
        title: String,
        font: UIFont = .systemFont(ofSize: 30, weight: .regular)
    ){
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = font
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.9889041781, green: 0.5770329833, blue: 0.002499261405, alpha: 1)
    }
    
    func applyStyleToFunctionButtons(
        _ button: UIButton,
        title: String
    ){
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 30)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .darkGray
    }
}

