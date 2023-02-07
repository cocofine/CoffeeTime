//
//  MineController.swift
//  CoffeeTime
//
//  Created by ouyangqi on 2022/1/8.
//

import UIKit

class MineController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.yellow
        let s: String? = Optional("")
        let test = Test()
        test.demo7()
    }

    final class Test {
        private class Pokemon: CustomDebugStringConvertible {
            let name: String
            init(name: String) {
                self.name = name
            }
            var debugDescription: String { "<Pokemon \(name)>" }
            deinit { print("\(self) escaped") }
        }
        
        private func delay(_ second: Double, closure: @escaping () -> Void) {
            DispatchQueue.main.asyncAfter(deadline: .now() + second, execute: closure)
        }
        
        func demo1() {
            var pokemon = Pokemon(name: "Mew")
            print("🌞 before closure: \(pokemon)")
            delay(1) {
                print("🌞 inside closure: \(pokemon)")
            }
            pokemon = Pokemon(name: "Mewtwo")
            print("🌞 after closure: \(pokemon)")
        }
        
        func demo2() {
            var value = 1
            print("🌞 before closure: \(value)")
            delay(1) {
                print("🌞 inside closure: \(value)")
            }
            value = 2
            print("🌞 after closure: \(value)")
        }

        func demo7() {
          var pokemon = Pokemon(name: "Mew")
          print("➡️ Initial pokemon is \(pokemon)")

          delay(1) { [capturedPokemon = pokemon] in
            print("closure 1 — pokemon captured at creation time: \(capturedPokemon)")
            print("closure 1 — variable evaluated at execution time: \(pokemon)")
            pokemon = Pokemon(name: "Pikachu")
            print("closure 1 - pokemon has been now set to \(pokemon)")
          }

          pokemon = Pokemon(name: "Mewtwo")
          print("🔄 pokemon changed to \(pokemon)")

          delay(2) { [capturedPokemon = pokemon] in
            print("closure 2 — pokemon captured at creation time: \(capturedPokemon)")
            print("closure 2 — variable evaluated at execution time: \(pokemon)")
            pokemon = Pokemon(name: "Charizard")
            print("closure 2 - value has been now set to \(pokemon)")
          }
        }
    }
    
    
}
