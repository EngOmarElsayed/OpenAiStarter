//
//  ContentView.swift
//  OpenAI
//
//  Created by Eng.Omar Elsayed on 05/12/2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: OpenAIViewModel
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
                .padding()
            VStack(alignment: .leading) {
                TextField("Ask Anything to OpenAI", text: $viewModel.message)
                    .fontDesign(.monospaced)
                    .padding()
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(lineWidth: 0.5)
                    }
                    .onSubmit {
                        Task {
                            await viewModel.sendMessageToOpenAi()
                        }
                    }
                
                HStack(alignment: .firstTextBaseline){
                    Group{
                        Text("AI:")
                        Text(viewModel.response)
                    }
                    .font(.system(size: 17))
                    .fontDesign(.monospaced)
                    .padding()
                    
                }
                
            }
            Spacer()
        }.padding()
    }
}

#Preview {
    ContentView()
        .environmentObject(OpenAIViewModel())
}
