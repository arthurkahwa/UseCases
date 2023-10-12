//
//  WideProductItem.swift
//  AppleWatchStore
//
//  Created by Arthur Nsereko Kahwa on 10/12/23.
//

import SwiftUI

struct WideProductItem: View {
    var body: some View {
        ZStack {
            HStack(alignment: .bottom, spacing: 0) {
                VStack(spacing: 5) {
                    ZStack {
                        Image(.sportBandProductRedL)
                            .resizable()
                            .frame(width: 250, height: 250)
                        
                        Image(.aluminumMidnightL)
                            .resizable()
                            .frame(width: 250, height: 250)
                    }
                    .frame(width: 150)
                    .padding(.trailing)
                    
                    HStack {
                        ForEach(0..<3) { item in
                            Circle()
                                .frame(width: 20, height: 20)
                        }
                    }
                }
                
                Spacer()
                
                VStack(alignment: .trailing, spacing: -4) {
                    Text("€").ultraLight() + Text("999").heavy()
                    
                    VStack(alignment: .trailing) {
                        Text("Starlight Aluminium")
                            .condensed(.bold, size: 14)
                        
                        Text("Braided Solo Loop")
                            .condensed(.light, size: 14)
                    }
                }
                .foregroundStyle(.primary)
            }
        }
        .padding()
        .frame(height: 220, alignment: .bottom)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Constants.gradient)
        )
        .frame(maxWidth: .infinity, alignment: .bottom)
        .overlay(alignment: .topTrailing) {
            Constants.heart
        }
        .padding(.horizontal)
    }
}

#Preview {
    WideProductItem()
}
