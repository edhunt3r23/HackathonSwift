//
//  CienciasView.swift
//  front
//
//  Created by Alumno on 15/03/24.
//

import Foundation
import SwiftUI

struct CienciasView: View{
    @State var isPresented: Bool = false
    @State private var isCorrectAnswerSelected = false
    var body: some View{
        Text("¿Cuál es el siguiente elemento?")
        //pregunta
        HStack{
            Image(.siliconImg)
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
                    Label("Silicón", systemImage: "")
                }
                
                NavigationLink{
                    NavigationStack{
                        CienciasView()
                    }
                } label : {
                    Label("Cobre", systemImage: "")
                }
                NavigationLink{
                    NavigationStack{
                        CienciasView()
                    }
                } label : {
                    Label("Hierro", systemImage: "")
                }
            }

        }
    }
}

#Preview {
    CienciasView()
}
