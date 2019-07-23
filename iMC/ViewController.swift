//
//  ViewController.swift
//  iMC
//
//  Copyright © 2019 Rafaela Galdino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultImageView: UIImageView!
    @IBOutlet weak var imageView: UIView!
    
    var imc: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true) // Esconde o teclado quando clicar em qualquer lugar da tela
    }
    
    @IBAction func calculate(_ sender: Any) {
        if let weight = Double(weightTextField.text!), let height = Double(heightTextField.text!) {
            imc = weight / pow(height, 2)
            showResults()
        }
    }
    
    func showResults() {
        var result: String = ""
        var image: String = ""
        switch imc {
            case 0..<16:
                result = "Magreza"
                image = "abaixo"
            case 16..<18.5:
                result = "Abaixo do peso"
                image = "abaixo"
            case 18..<25:
                result = "Peso ideal"
                image = "ideal"
            case 25..<30:
                result = "Sobre peso"
                image = "sobre"
            default:
                result = "Obesidade"
                image = "obesidade"
        }
        resultLabel.text = "\(Int(imc)): \(result)"
        resultImageView.image = UIImage(named: image)
        imageView.isHidden = false
        view.endEditing(true) // Esconde o teclado quando resultado for mostrado na tela
    }
}

