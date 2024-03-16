//
//  AprenderView.swift
//  front
//
//  Created by Alumno on 15/03/24.
//

import SwiftUI
import RealityKit
import RealityKitContent
import OpenAI
import AVFoundation

class ChatController: ObservableObject {
    @Published var messages: [Message] = []
    
    let openAI = OpenAI(apiToken: "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")

    func sendNewMessage(content: String){
        let userMessage = Message(content: content, isUser: true)
        self.messages.append(userMessage)
        getBotReply()
    }
    
    func getBotReply(){
        let personality = [Chat(role: .user, content: "Eres un asistente escolar de primaria, debes ayudar a los niños a comprender los temas escolares de manera sencilla.")]
        openAI.chats(query: .init(model: .gpt3_5Turbo,
                                  messages: personality + self.messages.map({Chat(role: .user, content: $0.content)}))) {
            result in
            switch result {
            case .success(let success):
                guard let choice = success.choices.first else{
                    return
                }
                let message = choice.message.content
               
                DispatchQueue.main.async {
                    self.messages.append(Message(content: message ?? "", isUser: false))
                }
            case .failure(let failure):
                print(failure)
            }
        }
    }
}

struct Message: Identifiable{
    var id: UUID = .init()
    var content: String
    var isUser: Bool
}

struct AprenderView: View {
    @StateObject var chatController: ChatController = .init()
    @State var string: String = ""
    var body: some View {
        VStack{
            Text("¡Hola! ¿Qué tema deseas que te explique?").font(.system(size: 32, weight: .light, design: .none))
            ScrollView{
                ForEach(chatController.messages){
                    message in
                    MessageView(message: message)
                        .padding(35)
                }
            }
            Spacer()
            Divider()
            HStack{
                TextField("Message...", text: self.$string, axis: .vertical)
                    .padding(.init(top: 20, leading: 35, bottom: 20, trailing: 35))
                    .font(.system(size: 30))
                    .background(Color.gray.opacity(0.5))
                    .cornerRadius(5)
                Button{
                    self.chatController.sendNewMessage(content: string)
                    string = ""
                } label: {
                    Image(systemName: "paperplane")
                        .resizable()
                        .frame(width: 35, height: 35)
                        .scaledToFit()
                        .padding(20)
                }
            }
            .padding()
        }
    }
}

struct MessageView : View {
    var message: Message
    var body: some View {
        Group {
            if message.isUser {
                HStack {
                    Spacer()
                    Text(message.content)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                        .font(.system(size: 30))
                }
            } else {
                HStack {
                    Text(message.content)
                        .padding()
                        .background(Color.gray)
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                        .font(.system(size: 30))
                    Spacer()
                }
            }
        }
    }
}



#Preview{
    AprenderView()
}
