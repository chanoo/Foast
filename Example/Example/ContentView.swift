//
//  ContentView.swift
//  Example
//
//  Created by 성찬우 on 2023/04/21.
//

import SwiftUI
import Foast

struct ContentView: View {
    @State private var showModal = false

    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)

            VStack {
                Button(action: {
                    showModal.toggle()
                }, label: {
                    Text("Show Modal")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                })
            }
            .padding()
            .sheet(isPresented: $showModal, content: {
                ModalView(showModal: $showModal)
            })
        }
    }
}

struct ModalView: View {
    @Binding var showModal: Bool

    var body: some View {
        VStack {
            Text("This is a modal view")
                .font(.title)
                .padding(.bottom, 20)

            Button(action: {
                Foast.show(message: "This is a sample text using 'Hello, world!'", duration: 2)
                showModal.toggle()
            }, label: {
                Text("Show Toast and Close Modal")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.red)
                    .cornerRadius(8)
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
