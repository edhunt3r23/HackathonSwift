//
//  navigationToAreas.swift
//  front
//
//  Created by Romeo De la garza on 15/03/24.
//

import SwiftUI

struct navigationToAreas: View {
    var body: some View {
        VStack{
            Image(.logo)
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 200)
            Text("¡Bienvenido a StuddyBuddy!")
                .font(.title)
            Text("¿Quieres practicar o aprender algo nuevo?")
                .padding(.bottom, 20)
            NavigationLink{
                NavigationStack{
                    FlashCards()
                }
            } label : {
                Label("Flashcards", systemImage: "chevron.right")
            }
                
            NavigationLink{
                NavigationStack{
                    AprenderView()
                }
            } label : {
                Label("Aprender", systemImage: "chevron.right")
            }
        }
    }
}

#Preview {
    navigationToAreas()
}
