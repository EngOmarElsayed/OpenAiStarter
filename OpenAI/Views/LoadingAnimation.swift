//
//  LoadingAnimation.swift
//  OpenAI
//
//  Created by Eng.Omar Elsayed on 06/02/2024.
//

import SwiftUI

struct LoadingAnimation: View {
    @State var isLoading = false
    
    var body: some View {
        Circle()
            .foregroundStyle(.aicolor)
            .frame(width: isLoading ? 20: 30)
            .opacity(isLoading ? 0.5: 0.1)
            .onAppear {
                withAnimation(.linear(duration: 0.75).repeatForever()){
                    isLoading.toggle()
                }
            }
    }
}

#Preview {
    LoadingAnimation()
}
