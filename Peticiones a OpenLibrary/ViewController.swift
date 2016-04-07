//
//  ViewController.swift
//  Peticiones a OpenLibrary
//
//  Created by Arturo Rivas on 7/4/16.
//  Copyright © 2016 Arturo Rivas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pulsoBuscar(sender: AnyObject) {
        let textField = sender as! UITextField
        
        let url = NSURL(string: "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:" + textField.text!)
        
        do {
            let respuesta = try String(contentsOfURL: url!, encoding: NSUTF8StringEncoding)
            
            if respuesta != "{}" {
                textView.text = respuesta
            } else {
                textView.text = "El ISBN proporcionado no corresponde a ningún libro registrado en Open Library"
            }
            
        } catch {
            let alert = UIAlertController(title: "Error", message: "Hay problemas con la conexión a Internet. Inténtelo de nuevo más tarde.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
}

