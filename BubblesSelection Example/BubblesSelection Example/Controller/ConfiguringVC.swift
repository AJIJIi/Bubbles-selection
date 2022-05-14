//
//  ConfiguringVC.swift
//  BubblesSelection Example
//
//  Created by Aleksei Bochkov on 04/04/22.
//

import UIKit
//import BubblesSelection
import AVFoundation

//VC to configure shown Scene
final class ConfiguringVC: CustomVC {
    
    private let nextButton = NextButton(title: "Apply")
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true
        return scrollView
    }()
    
    //MARK: - Bubble configuration
    
    private let bubbleTitleLabel = ConfiguringTitileLabel("Bubble configuration")
    private let radiusLabel = ConfiguringParameterLabel("Radius: 50.0")
    private let radiusSlider = UISlider(min: 5, max: 100, initial: 50)
    
    private let coverButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        button.titleLabel?.textColor = .systemBlue
        button.setTitle("Add cover", for: .normal)
        button.imageView?.contentMode = .scaleToFill
        button.imageView?.layer.cornerRadius = 50
        button.layer.cornerRadius = 50
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemBlue.cgColor
        return button
    }()
    
    private let fillColorLabel = ConfiguringParameterLabel("Fill")
    private let fillColorWell = UIColorWell(title: "Fill Color", initialColor: .white)
    
    //MARK: - Text configuration
    
    private let textSubtitleLabel = ConfiguringSubtitleLabel("Text")
    private let textColorLabel = ConfiguringParameterLabel("Text")
    private let textColorWell = UIColorWell(title: "Text Color", initialColor: .black)
    
    private let textsTextField: UITextField = {
        let textField = UITextField()
        textField.font = .systemFont(ofSize: 15.adapted())
        textField.textAlignment = .left
        textField.clearButtonMode = .always
        textField.returnKeyType = .done
        textField.enablesReturnKeyAutomatically = false
        textField.placeholder = "Text inside bubbles"
        textField.layer.borderColor = UIColor.dynamicColor(light: .black, dark: .white).cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 5
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: textField.frame.height))
        textField.leftViewMode = .always
        return textField
    }()
    
    private let fontSizeLabel = ConfiguringParameterLabel("Size of the text: 15.0")
    private let fontSizeSlider = UISlider(min: 1, max: 50, initial: 15)
    
    //MARK: - Border configuration
    
    private let borderSubtitleLabel = ConfiguringSubtitleLabel("Border")
    private let borderColorLabel = ConfiguringParameterLabel("Border")
    private let borderColorWell = UIColorWell(title: "Border Color", initialColor: .black)
    private let widthLabel = ConfiguringParameterLabel("Border width: 1.0")
    private let widthSlider = UISlider(min: 1, max: 10, initial: 1)
    
    //MARK: - Border configuration
    
    private let selectedSubtitleLabel = ConfiguringSubtitleLabel("Selected state")
    private let selectedColorLabel = ConfiguringParameterLabel("Selected")
    private let selectedColorWell = UIColorWell(title: "Selected Color", initialColor: .red)
    private let selectedRatioLabel = ConfiguringParameterLabel("Selected size ratio: 1.5")
    private let selectedRatioSlider = UISlider(min: 1, max: 3, initial: 1.5)
    
    //MARK: - Scene configuration
    
    private let sceneTitleLabel = ConfiguringTitileLabel("Scene configuration")
    private let magnetStrengthLabel = ConfiguringParameterLabel("Strength of the magnet: 15000.0")
    private let magnetStrengthSlider = UISlider(min: 500, max: 30000, initial: 15000)
    private let countLabel = ConfiguringParameterLabel("Number of bubbles: 20")
    private let countSlider = UISlider(min: 1, max: 100, initial: 20)
    private let backgroundColorLabel = ConfiguringParameterLabel("Background")
    private let backgroundColorWell = UIColorWell(title: "Background Color", initialColor: .clear)
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.contentSize = .init(width: UIScreen.main.bounds.width, height: 886.adaptedHeight() + 90)
    }
    
    override func configureViews() {
        super.configureViews()
        title = "Settings"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Random", style: .plain, target: self, action: #selector(randomDemoButtonTapped))
        
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        coverButton.addTarget(self, action: #selector(coverButtonTapped), for: .touchUpInside)
        radiusSlider.addTarget(self, action: #selector(radiusSliderValueChanged), for: .valueChanged)
        countSlider.addTarget(self, action: #selector(countSliderValueChanged), for: .valueChanged)
        widthSlider.addTarget(self, action: #selector(widthSliderValueChanged), for: .valueChanged)
        fontSizeSlider.addTarget(self, action: #selector(fontSizeSliderValueChanged), for: .valueChanged)
        magnetStrengthSlider.addTarget(self, action: #selector(magnetStrengthSliderValueChanged), for: .valueChanged)
        selectedRatioSlider.addTarget(self, action: #selector(selectedRatioSliderValueChanged), for: .valueChanged)
        
        textsTextField.delegate = self
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        view.addSubview(scrollView)
        scrollView.addEqualConstraints(
            bottom: (view.safeAreaLayoutGuide.bottomAnchor, -10.adaptedHeight()),
            top: (view.safeAreaLayoutGuide.topAnchor, 10.adaptedWidth()),
            left: (view.safeAreaLayoutGuide.leftAnchor, 0),
            right: (view.safeAreaLayoutGuide.rightAnchor, 0)
        )
        
        //MARK: - Bubbles configuration layout
        
        scrollView.addSubview(bubbleTitleLabel)
        bubbleTitleLabel.addEqualConstraints(
            top: (scrollView.topAnchor, 0),
            left: (scrollView.leftAnchor, 20.adaptedWidth()),
            centerX: (scrollView.centerXAnchor, 0),
            height: 30.adaptedHeight()
        )
        
        scrollView.addSubview(radiusLabel)
        radiusLabel.addEqualConstraints(
            top: (bubbleTitleLabel.bottomAnchor, 15.adaptedHeight()),
            left: (bubbleTitleLabel.leftAnchor, 15.adaptedWidth()),
            height: 20.adaptedHeight()
        )
        radiusLabel.centerXAnchor.constraint(lessThanOrEqualTo: scrollView.centerXAnchor, constant: 0).isActive = true
        
        scrollView.addSubview(radiusSlider)
        radiusSlider.addEqualConstraints(
            top: (radiusLabel.bottomAnchor, 10.adaptedHeight()),
            left: (radiusLabel.leftAnchor, 0),
            centerX: (scrollView.centerXAnchor, 0),
            height: 20.adaptedHeight()
        )
        
        scrollView.addSubview(coverButton)
        coverButton.addEqualConstraints(
            top: (radiusSlider.bottomAnchor, 15.adaptedHeight()),
            centerX: (scrollView.centerXAnchor, -65.adaptedWidth()),
            height: 100,
            width: 100
        )
        
        scrollView.addSubview(fillColorLabel)
        fillColorLabel.addEqualConstraints(
            top: (coverButton.topAnchor, 0),
            left: (coverButton.rightAnchor, 30.adaptedWidth()),
            height: 15.adaptedHeight(),
            width: 70.adaptedWidth()
        )
        
        scrollView.addSubview(fillColorWell)
        fillColorWell.addEqualConstraints(
            top: (fillColorLabel.bottomAnchor, -5),
            centerX: (fillColorLabel.centerXAnchor, 0),
            height: 70.adaptedHeight(),
            width: 70.adaptedHeight()
        )
        
        //MARK: - Text configuration layout
        
        scrollView.addSubview(textSubtitleLabel)
        textSubtitleLabel.addEqualConstraints(
            top: (coverButton.bottomAnchor, 15.adaptedHeight()),
            left: (bubbleTitleLabel.leftAnchor, 5),
            centerX: (scrollView.centerXAnchor, 0),
            height: 22.adaptedHeight()
        )
        
        scrollView.addSubview(textColorLabel)
        textColorLabel.addEqualConstraints(
            top: (textSubtitleLabel.bottomAnchor, 15.adaptedHeight()),
            left: (textSubtitleLabel.leftAnchor, 10.adaptedWidth()),
            height: 15.adaptedHeight(),
            width: 70.adaptedWidth()
        )
        
        scrollView.addSubview(textColorWell)
        textColorWell.addEqualConstraints(
            top: (textColorLabel.bottomAnchor, -5),
            centerX: (textColorLabel.centerXAnchor, 0),
            height: 70.adaptedHeight(),
            width: 70.adaptedHeight()
        )
        
        scrollView.addSubview(textsTextField)
        textsTextField.addEqualConstraints(
            top: (textColorLabel.topAnchor, 20.adaptedHeight()),
            left: (textColorLabel.rightAnchor, 15.adaptedWidth()),
            centerX: (scrollView.centerXAnchor, 40.adaptedWidth()),
            height: 40.adaptedHeight()
        )
        
        scrollView.addSubview(fontSizeLabel)
        fontSizeLabel.addEqualConstraints(
            top: (textColorWell.bottomAnchor, 5),
            left: (textSubtitleLabel.leftAnchor, 10.adaptedWidth()),
            height: 20.adaptedHeight()
        )
        fontSizeLabel.centerXAnchor.constraint(lessThanOrEqualTo: scrollView.centerXAnchor, constant: 0).isActive = true
        
        scrollView.addSubview(fontSizeSlider)
        fontSizeSlider.addEqualConstraints(
            top: (fontSizeLabel.bottomAnchor, 10.adaptedHeight()),
            left: (fontSizeLabel.leftAnchor, 0),
            centerX: (scrollView.centerXAnchor, 0),
            height: 20.adaptedHeight()
        )
        
        //MARK: - Border configuration layout
        
        scrollView.addSubview(borderSubtitleLabel)
        borderSubtitleLabel.addEqualConstraints(
            top: (fontSizeSlider.bottomAnchor, 15.adaptedHeight()),
            left: (bubbleTitleLabel.leftAnchor, 5),
            centerX: (scrollView.centerXAnchor, 0),
            height: 22.adaptedHeight()
        )
        
        scrollView.addSubview(borderColorLabel)
        borderColorLabel.addEqualConstraints(
            top: (borderSubtitleLabel.bottomAnchor, 15.adaptedHeight()),
            left: (borderSubtitleLabel.leftAnchor, 10.adaptedWidth()),
            height: 15.adaptedHeight(),
            width: 70.adaptedWidth()
        )
        
        scrollView.addSubview(borderColorWell)
        borderColorWell.addEqualConstraints(
            top: (borderColorLabel.bottomAnchor, -5),
            centerX: (borderColorLabel.centerXAnchor, 0),
            height: 70.adaptedHeight(),
            width: 70.adaptedHeight()
        )
        
        scrollView.addSubview(widthLabel)
        widthLabel.addEqualConstraints(
            top: (borderColorLabel.topAnchor, 10.adaptedHeight()),
            left: (borderColorLabel.rightAnchor, 15.adaptedWidth()),
            height: 20.adaptedHeight()
        )
        widthLabel.centerXAnchor.constraint(lessThanOrEqualTo: scrollView.centerXAnchor, constant: 42.adaptedWidth()).isActive = true
        
        scrollView.addSubview(widthSlider)
        widthSlider.addEqualConstraints(
            top: (widthLabel.bottomAnchor, 10.adaptedHeight()),
            left: (widthLabel.leftAnchor, 0),
            centerX: (scrollView.centerXAnchor, 42.adaptedWidth()),
            height: 20.adaptedHeight()
        )
        
        //MARK: - Selected state configuration layout
        
        scrollView.addSubview(selectedSubtitleLabel)
        selectedSubtitleLabel.addEqualConstraints(
            top: (borderColorWell.bottomAnchor, 5),
            left: (bubbleTitleLabel.leftAnchor, 5),
            centerX: (scrollView.centerXAnchor, 0),
            height: 22.adaptedHeight()
        )
        
        scrollView.addSubview(selectedColorLabel)
        selectedColorLabel.addEqualConstraints(
            top: (selectedSubtitleLabel.bottomAnchor, 15.adaptedHeight()),
            left: (selectedSubtitleLabel.leftAnchor, 10.adaptedWidth()),
            height: 15.adaptedHeight(),
            width: 70.adaptedWidth()
        )
        
        scrollView.addSubview(selectedColorWell)
        selectedColorWell.addEqualConstraints(
            top: (selectedColorLabel.bottomAnchor, -5),
            centerX: (selectedColorLabel.centerXAnchor, 0),
            height: 70.adaptedHeight(),
            width: 70.adaptedHeight()
        )
        
        scrollView.addSubview(selectedRatioLabel)
        selectedRatioLabel.addEqualConstraints(
            top: (selectedColorLabel.topAnchor, 10.adaptedHeight()),
            left: (selectedColorLabel.rightAnchor, 15.adaptedWidth()),
            height: 20.adaptedHeight()
        )
        selectedRatioLabel.centerXAnchor.constraint(lessThanOrEqualTo: scrollView.centerXAnchor, constant: 42.adaptedWidth()).isActive = true
        
        scrollView.addSubview(selectedRatioSlider)
        selectedRatioSlider.addEqualConstraints(
            top: (selectedRatioLabel.bottomAnchor, 10.adaptedHeight()),
            left: (selectedRatioLabel.leftAnchor, 0),
            centerX: (selectedRatioLabel.centerXAnchor, 42.adaptedWidth()),
            height: 20.adaptedHeight()
        )
        
        //MARK: - Scene configuration layout
        
        scrollView.addSubview(sceneTitleLabel)
        sceneTitleLabel.addEqualConstraints(
            top: (selectedColorWell.bottomAnchor, 10.adaptedHeight()),
            left: (scrollView.leftAnchor, 20.adaptedWidth()),
            centerX: (scrollView.centerXAnchor, 0),
            height: 30.adaptedHeight()
        )
        
        scrollView.addSubview(magnetStrengthLabel)
        magnetStrengthLabel.addEqualConstraints(
            top: (sceneTitleLabel.bottomAnchor, 15.adaptedHeight()),
            left: (sceneTitleLabel.leftAnchor, 15.adaptedWidth()),
            height: 20.adaptedHeight()
        )
        magnetStrengthLabel.centerXAnchor.constraint(lessThanOrEqualTo: scrollView.centerXAnchor, constant: 0).isActive = true
        
        scrollView.addSubview(magnetStrengthSlider)
        magnetStrengthSlider.addEqualConstraints(
            top: (magnetStrengthLabel.bottomAnchor, 10.adaptedHeight()),
            left: (magnetStrengthLabel.leftAnchor, 0),
            centerX: (scrollView.centerXAnchor, 0),
            height: 20.adaptedHeight()
        )
        
        scrollView.addSubview(countLabel)
        countLabel.addEqualConstraints(
            top: (magnetStrengthSlider.bottomAnchor, 15.adaptedHeight()),
            left: (sceneTitleLabel.leftAnchor, 15.adaptedWidth()),
            height: 20.adaptedHeight()
        )
        countLabel.centerXAnchor.constraint(lessThanOrEqualTo: scrollView.centerXAnchor, constant: 0).isActive = true
        
        scrollView.addSubview(countSlider)
        countSlider.addEqualConstraints(
            top: (countLabel.bottomAnchor, 10.adaptedHeight()),
            left: (countLabel.leftAnchor, 0),
            centerX: (scrollView.centerXAnchor, 0),
            height: 20.adaptedHeight()
        )
        
        scrollView.addSubview(backgroundColorLabel)
        backgroundColorLabel.addEqualConstraints(
            top: (countSlider.bottomAnchor, 15.adaptedHeight()),
            left: (sceneTitleLabel.leftAnchor, 15.adaptedWidth()),
            centerX: (scrollView.centerXAnchor, 0),
            height: 20.adaptedHeight()
        )
        
        scrollView.addSubview(backgroundColorWell)
        backgroundColorWell.addEqualConstraints(
            top: (backgroundColorLabel.bottomAnchor, -5),
            centerX: (backgroundColorLabel.centerXAnchor, 0),
            height: 70.adaptedHeight(),
            width: 70.adaptedHeight()
        )
        
        view.addSubview(nextButton)
        nextButton.addEqualConstraints(
            top: (backgroundColorWell.bottomAnchor, 15.adaptedHeight()),
            centerX: (view.safeAreaLayoutGuide.centerXAnchor, 0),
            height: 20.adaptedHeight()
        )
        nextButton.leftAnchor.constraint(greaterThanOrEqualTo: scrollView.leftAnchor, constant: 15).isActive = true
    }
}

//MARK: - Target functions
private extension ConfiguringVC {
    @objc func nextButtonTapped() {
        if Int(countSlider.value.rounded()) > 5, coverButton.image(for: .normal) != nil {
            let alert = UIAlertController(title: "Attention",
                                          message: "Creating a lot of bubbles with cover might take some time",
                                          preferredStyle: .alert)
            
            alert.addAction(.init(title: "Do it!", style: .default, handler: { _ in
                self.showBubbleVC()
            }))
            alert.addAction(.init(title: "Cancel", style: .cancel, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        } else {
            showBubbleVC()
        }
    }
    
    func showBubbleVC() {
        let bubblecVC = BubblesVC()
        for index in 0 ... Int(countSlider.value.rounded()) - 1 {
            let bubbleTitle = textsTextField.text! == "" ? AppConstants.defaultTitles[index % AppConstants.defaultTitles.count] : textsTextField.text!
            bubblecVC.bubbles.append(
                BubbleData(radius: CGFloat(radiusSlider.value),
                           attributedText: NSAttributedString(
                            string: bubbleTitle,
                            attributes: [.foregroundColor: textColorWell.selectedColor!,
                                         .font: UIFont.systemFont(ofSize: CGFloat(fontSizeSlider.value))]),
                           image: coverButton.image(for: .normal),
                           fillColor: fillColorWell.selectedColor!,
                           borderColor: borderColorWell.selectedColor!,
                           borderWidth: CGFloat(widthSlider.value),
                           selectedColor: selectedColorWell.selectedColor!,
                           selectedRatio: CGFloat(selectedRatioSlider.value)))
        }
        bubblecVC.backgroundColor = backgroundColorWell.selectedColor!
        bubblecVC.magnetStrength = CGFloat(magnetStrengthSlider.value)
        navigationController?.pushViewController(bubblecVC, animated: true)
    }
    
    @objc func randomDemoButtonTapped() {
        let bubblecVC = BubblesVC()
        for index in 0 ... Int.random(in: 10...20) - 1 {
            bubblecVC.bubbles.append(
                BubbleData(radius: CGFloat.random(in: 30...50),
                           attributedText: NSAttributedString(
                            string: AppConstants.defaultTitles[index % AppConstants.defaultTitles.count],
                            attributes: [.foregroundColor: UIColor.random(isDark: true),
                                         .font: UIFont.systemFont(ofSize: CGFloat.random(in: 10...20))]),
                           fillColor: UIColor.random(isDark: false),
                           borderColor: UIColor.random(isDark: true),
                           borderWidth: CGFloat.random(in: 1...5),
                           selectedColor: UIColor.random(isDark: true),
                           selectedRatio: CGFloat.random(in: 1.5...2.5)))
        }
        bubblecVC.backgroundColor = UIColor.random(isDark: false)
        bubblecVC.magnetStrength = CGFloat.random(in: 5000...20000)
        navigationController?.pushViewController(bubblecVC, animated: true)
    }
    
    @objc func radiusSliderValueChanged() {
        radiusLabel.text = "Radius: \(radiusSlider.value.rounded())"
    }
    
    @objc func countSliderValueChanged() {
        countLabel.text = "Number of bubbles: \(Int(countSlider.value.rounded()))"
    }
    
    @objc func widthSliderValueChanged() {
        widthLabel.text = "Border width: \(widthSlider.value.rounded())"
    }
    
    @objc func fontSizeSliderValueChanged() {
        fontSizeLabel.text = "Size of the text: \(fontSizeSlider.value.rounded())"
    }
    
    @objc func selectedRatioSliderValueChanged() {
        selectedRatioLabel.text = "Selected size ratio: \(String(selectedRatioSlider.value).prefix(3))"
    }
    
    @objc func magnetStrengthSliderValueChanged() {
        magnetStrengthLabel.text = "Strength of the magnet: \(magnetStrengthSlider.value.rounded())"
    }
}

//MARK: - extension related to adding cover
extension ConfiguringVC: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @objc func coverButtonTapped() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary), let availableMediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary), availableMediaTypes.contains("public.image") {
            alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { (_) in
                let imagePicker = UIImagePickerController()
                imagePicker.sourceType = .photoLibrary
                imagePicker.allowsEditing = false
                imagePicker.mediaTypes = ["public.image"]
                imagePicker.delegate = self
                if (UIImagePickerController.isSourceTypeAvailable(.photoLibrary)) {
                    self.present(imagePicker, animated: true, completion: nil)
                }
            }))
        }
        
        if coverButton.image(for: .normal) != nil {
            alert.addAction(UIAlertAction(title: "Delete photo", style: .default, handler: {(_) in
                self.updatePhoto(image: nil)
            }))
        }
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil )
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            updatePhoto(image: originalImage)
        }
        picker.dismiss(animated: true)
    }
    
    private func updatePhoto(image: UIImage?) {
        coverButton.setImage(image?.withRenderingMode(.alwaysOriginal), for: .normal)
        coverButton.titleLabel?.isHidden = image != nil
    }
}

//MARK: - Textfield extension
extension ConfiguringVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 1, animations: {
            self.scrollView.contentOffset = .init(x: 0, y: 232.adaptedHeight() + 10)
        })
    }
}
