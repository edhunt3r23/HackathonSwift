//
//  RespuestaC.swift
//  front
//
//  Created by Alumno on 16/03/24.
//

import Foundation
import SwiftUI

struct RespuestaC: View {
    var body: some View {
        VStack{
            Text("¡Respuesta Correcta!").padding()
            NavigationLink{
                NavigationStack{
                    navigationToAreas()
                }
            } label : {
                Label("Pulsa para regresar", systemImage: "")
            }
        }
    }
}
#Preview {
    RespuestaC()
}
