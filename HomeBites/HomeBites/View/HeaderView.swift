//
//  HeaderView.swift
//  HomeBites
//
//  Created by LAU TSZ YING on 5/6/2025.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            Image("kitchen_cupboard")
                .resizable()
                .scaledToFill()
                .frame(height: 150)
                .clipped()
                .opacity(0.9)
            
            VStack(alignment: .leading) {
                Text("HomeBites")
                    .font(.title2.bold())
                    .foregroundStyle(.white)
                    .shadow(radius: 4)
    
                HStack(spacing: 8) {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                        .foregroundStyle(.white)
    
                    Text("The Cozy Stove")
                        .bold()
                        .foregroundStyle(.white)
                        .shadow(radius: 4)
    
                    Spacer()
                }
            }.padding()
        }
    }
}

#Preview {
    HeaderView()
}
