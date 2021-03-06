//
//  Dealer.swift
//  ClassesMagicFun
//
//  Created by Michael Dippery on 7/30/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Dealer {
    init() {
        self.deck = Deck()
        self.player = Player(name: "Player")
        self.house = House()
        
    }
    
    var deck: Deck
    var player: Player
    var house: House
    var winner: Player? //is set to a name when the winner has blackjack
    
    func deal() {
        self.player.dealCard(self.deck.drawCard()!)
        self.player.dealCard(self.deck.drawCard()!)
        if(self.player.isBlackJack) {
                        self.winner = self.player
                    }
        self.house.dealCard(self.deck.drawCard()!)
        self.house.dealCard(self.deck.drawCard()!)
        if(self.house.isBlackJack) {
                        self.winner = self.house
                    }
    }
    func turn(_ player: Player) {
                while(player.willHit(100)) {
                        player.dealCard(deck.drawCard()!)
                    }
            }
    func award(_ bet: UInt) {
                if(winner!.name == "Player") {
                        player.wallet += bet
                            house.wallet -= bet
                    } else {
                        player.wallet -= bet
                            house.wallet += bet
                    }
            }
    
}
