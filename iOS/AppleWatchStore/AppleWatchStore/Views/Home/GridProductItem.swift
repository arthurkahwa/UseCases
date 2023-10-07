//
//  GridProductItem.swift
//  AppleWatchStore
//
//  Created by Arthur Nsereko Kahwa on 10/7/23.
//

import SwiftUI

struct GridProductItem: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                ZStack {
                    Image(.sportBandProductRedL)
                        .resizable()
                        .frame(width: 250, height: 250)
                    
                    Image(.aluminumMidnightL)
                        .resizable()
                        .frame(width: 250, height: 250)
                }
                
                VStack {
                    Text("€").ultraLight() + Text("999").heavy()
                    
                    Text("Starlight Aluminium")
                        .condensed(.bold, size: 14)
                    
                    Text("Braided Solo Loop")
                        .condensed(.light, size: 14)
                }
                .foregroundStyle(.primary)
                .padding(.bottom, 5)
                
                HStack {
                    ForEach(0..<3) { item in
                        Circle()
                            .frame(width: 20, height: 20)
                    }
                }
                .padding(.bottom)
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .background {
            RoundedRectangle(cornerRadius: 10)
                .fill(Constants.gradient)
        }
        .overlay(alignment: .topTrailing) {
            heart
        }
    }
    
    var heart: some View {
        Image(systemName: "heart")
            .symbolVariant(.none)
            .font(.system(size: 24))
            .padding(.top, 10)
            .padding(.trailing, 20)
    }
}

#Preview {
    GridProductItem()
}
