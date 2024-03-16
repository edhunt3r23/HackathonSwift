//
//  MatematicasView.swift
//  front
//
//  Created by Alumno on 15/03/24.
//

import Foundation
import SwiftUI

struct MatematicasView: View{
    @State private var isCorrectAnswerSelected = false
    var body: some View{
        Text("¿Cuánto es 250 x 2?")
        //pregunta
        HStack{
            Image(.m)
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 200)
                .padding(.trailing, 200)
            VStack{
                //Botones respuesta
                NavigationLink{
                    NavigationStack{
                        MatematicasView()
                    }
                } label : {
                    Label("505", systemImage: "")
                }
                
                NavigationLink{
                    NavigationStack{
                        MatematicasView()
                    }
                } label : {
                    Label("450", systemImage: "")
                }
                NavigationLink{
                    NavigationStack{
                        RespuestaC()
                    }
                } label : {
                    Label("500", systemImage: "")
                }
            }
        }
    }
}
#Preview {
    MatematicasView()
}
