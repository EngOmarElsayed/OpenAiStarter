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
        ScrollView {
            ScrollViewReader { proxy in
                VStack {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                        .padding()
                    VStack(alignment: .leading) {
                        HStack {
                            TextField("Ask Anything to OpenAI", text: $viewModel.message)
                                .foregroundStyle(.aicolor)
                                .fontDesign(.monospaced)
                                .padding()
                                .onSubmit {
                                    Task {
                                        await viewModel.sendMessageToOpenAi()
                                    }
                                }
                            
                            Button(action: {
                                Task {
                                    await viewModel.sendMessageToOpenAi()
                                }
                            }, label: {
                                Image(systemName: "paperplane")
                                    .foregroundStyle(.aicolor)
                                    .padding()
                            })
                            
                        }.overlay {
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(lineWidth: 0.5)
                                .foregroundStyle(.aicolor)
                        }
                        
                        HStack(alignment: viewModel.isLoading ? .center: .firstTextBaseline){
                            Group{
                                Text("AI:")
                                Text(viewModel.response)
                                    .id("scroll")
                                    .overlay {
                                        if viewModel.isLoading {
                                            LoadingAnimation()
                                        }
                                    }
                            }
                            .foregroundStyle(.aicolor)
                            .font(.system(size: 17))
                            .fontDesign(.monospaced)
                            .padding()
                            
                        }
                        
                    }
                    Spacer()
                }.padding()
                    .onChange(of: viewModel.response) { _ in
                        proxy.scrollTo("scroll", anchor: .bottom)
                    }
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(OpenAIViewModel())
}
