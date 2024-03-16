//
//  FlashCards.swift
//  front
//
//  Created by Alumno on 15/03/24.
//

import SwiftUI

struct FlashCards: View {
    @State private var isHovered = false
    
    var body: some View {
        VStack{
            NavigationLink{
                NavigationStack{
                    CienciasView()
                }
            } label : {
                VStack{
                    Label("Ciencias", systemImage: "chevron.right")
                    Text("Descubre conceptos cientifícos").font(.subheadline).foregroundColor(.white).bold()
                }
            }
                
            NavigationLink{
                NavigationStack{
                    MatematicasView()
                }
            } label : {
                VStack{
                    Label("Matematicas", systemImage: "chevron.right")
                    
                    Text("Resuelve problemas matemáticos")
                        .font(.subheadline)
                        .foregroundColor(.white).bold()
                }
            }
            
            NavigationLink{
                NavigationStack{
                    HistoriaView()
                }
            } label : {
                VStack{
                    Label("Historia", systemImage: "chevron.right")
                    Text("Explora eventos históricos").font(.subheadline).foregroundColor(.white).bold()
                }
            }
        }
    }
}


#Preview {
    FlashCards()
}
