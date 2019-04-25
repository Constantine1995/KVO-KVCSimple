//
//  ViewController.swift
//  KVO&KVC&DependencySimple
//
//  Created by mac on 4/24/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var labelText: UILabel!
    
    let user = User()
    
    // Следим за этой переменной
    @objc dynamic var inputText: String?
    
    // Ссылка на наблюдатель, переменная реализовывает функцию observe
    var inputTextObservation: NSKeyValueObservation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        user.setValue("Constantine", forKey: "name")
        print(user.getName())
        
        // Объявляем наблюдатель за изменением в переменной
        inputTextObservation = observe(\.inputText, options: .new) { (vc, change) in
            
            // Извлекаем опционал
            guard let updatedInputText = change.newValue as? String else { return }
            
            // Присваиваем полю наше новое название
            vc.labelText.text = updatedInputText
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        user.setValue("Dmytro", forKey: "name")
        print(user.getName())
        // private(set) - доступно только для чтения, присвоить значение переменной user.test = true нету возможности
        print(user.test)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        inputTextObservation?.invalidate()
    }
    
    @IBAction func Transition(_ sender: Any) {
        // Меняем значение переменной наблюдателя на новое значение
        inputText = textField.text
    }
    
    @IBAction func textFieldEditingChanged(_ sender: Any) {
        inputText = textField.text
    }
    
}

