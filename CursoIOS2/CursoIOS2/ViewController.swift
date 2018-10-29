//
//  ViewController.swift
//  CursoIOS2
//
//  Created by Usuario invitado on 29/10/18.
//  Copyright © 2018 Usuario invitado. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cajaDeTexto: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.navigationItem.rightBarButtonItem?.title = cajaDeTexto.text!
    }
    

    @IBAction func unwindVuelveCompa(unwindSegue: UIStoryboardSegue){}
}

