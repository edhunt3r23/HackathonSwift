//
//  HistoriaView.swift
//  front
//
//  Created by Alumno on 15/03/24.
//

import Foundation
import SwiftUI

struct HistoriaView: View{
    @State private var isCorrectAnswerSelected = false
    var body: some View{
        Text("¿Quién descubrió América?")
        //pregunta
        HStack{
            Image(.descubrimiento)
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 200)
                .padding(.trailing, 200)
            VStack{
                //Botones respuesta
                NavigationLink{
                    NavigationStack{
                        RespuestaC()
                    }
                } label : {
                    Label("Cristobal Colón", systemImage: "")
                }
                
                NavigationLink{
                    NavigationStack{
                        HistoriaView()
                    }
                } label : {
                    Label("Napoleón Bonaparte", systemImage: "")
                }
                NavigationLink{
                    NavigationStack{
                        HistoriaView()
                    }
                } label : {
                    Label("Albert Einstein", systemImage: "")
                }
            }
        }
    }
}

#Preview {
    CienciasView()
}
