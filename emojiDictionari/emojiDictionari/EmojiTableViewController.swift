//
//  EmojiTableViewController.swift
//  emojiDictionari
//
//  Created by macbook on 11/14/18.
//  Copyright © 2018 TitiBass. All rights reserved.
//

import UIKit

class EmojiTableViewController: UITableViewController {

    var emojis: [Emoji] = [
        Emoji(symbol: "🍝", name: "Sopita", description: "Sopa rica", usage: "Platillo"),
        Emoji(symbol: "🍔", name: "Hamburguesa", description: "Rica hamburguesa", usage: "Platillo"),
        Emoji(symbol: "🐶", name: "Perro", description: "Lindo animal", usage: "Mascota"),
        Emoji(symbol: "☃️", name: "Muñeco de Nieve", description: "Agua helada", usage: "Adorno"),
        Emoji(symbol: "🔥", name: "Fuego", description: "Caliente", usage: "Cocinar y quemar"),
        Emoji(symbol: "👽", name: "Alien", description: "De otro planeta", usage: "Miedo"),
        Emoji(symbol: "💸", name: "Dinero volando", description: "Ya no tendras dinero", usage: "Compras"),
        Emoji(symbol: "🔨", name: "Martillo", description: "Aparato de golpe", usage: "Golpear"),
        Emoji(symbol: "🕯", name: "Vela", description: "De cera", usage: "Para alumbrar"),
        Emoji(symbol: "🗑", name: "Basurero", description: "Para basura", usage: "Tiradero"),
        Emoji(symbol: "🎲", name: "Dado", description: "Cuadrado", usage: "Azár"),
        Emoji(symbol: "🏆", name: "Trofeo", description: "Premio", usage: "Recompensa"),
        Emoji(symbol: "🍑", name: "Durazno", description: "Fruta", usage: "Comida"),
        Emoji(symbol: "🌶", name: "Chile rojo", description: "Picante", usage: "Condimento"),
        Emoji(symbol: "🍎", name: "Manzana", description: "Rica fruta", usage: "Platillo")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        if section == 0
        {
        return emojis.count
        }
        else
        {
        return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmojiCel", for: indexPath)
        let emoji = emojis[indexPath.row]
        cell.textLabel?.text = "\(emoji.symbol) - \(emoji.name)"
        cell.detailTextLabel?.text = "\(emoji.description)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let emoji = emojis[indexPath.row]
        print ("\(emoji.symbol) \(indexPath)")
    }
   
    @IBAction func editButtomTapped(_ sender: UIBarButtonItem) {
        let tableViewEditingMode = tableView.isEditing
        setEditing(!tableViewEditingMode, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let movedEmoji = emojis.remove(at: fromIndexPath.row)
        emojis.insert(movedEmoji, at: to.row)
        tableView.reloadData()
    }
    
    

}
