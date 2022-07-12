//
//  ContentView.swift
//  klader-efter-vader-ios
//
//  Created by Christoffer on 2022-07-12.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            VStack(alignment: .center){
                Text("Kläder Efter Väder")
            }
            .padding()
            .frame(width: 390.0)
            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.788, green: 0.949, blue: 1.0)/*@END_MENU_TOKEN@*/)
            
            VStack(alignment: .center){
                Text("Välkommen till Kläder Efter Väder!")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                Text("Kläder efter väder finns här för att hjälpa dig med det svåra i vardagen, att välja kläder! Kanske ser det ut att vara strålande sol just nu men ska bli molnigt och blåsigt ikväll. Kanske är det molnigt nu men ska spöregna om några timmar. Hur det än blir så hjälper vi dig med klädvalet!")
                    .padding(.all)
                
            }
            Text("Vilken stad bor du i?")
                .font(.title3)
                .multilineTextAlignment(.leading)
                .padding(.leading)
            TextField("Välj stad", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                .padding()
            Button("Se vilka kläder du ska ta på dig idag!") {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
            }
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.788, green: 0.949, blue: 1.0)/*@END_MENU_TOKEN@*/)
            .foregroundColor(/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/)
            Button("Ta reda på om du behöver ta pollenmedicin idag!") {
            }
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.788, green: 0.949, blue: 1.0)/*@END_MENU_TOKEN@*/)
            .foregroundColor(/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/)

            Button("Ta reda på hur stark solkyddsfaktor du behöver ta idag!") {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
            }
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.788, green: 0.949, blue: 1.0)/*@END_MENU_TOKEN@*/)
            .foregroundColor(/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
