//
//  CardsView.swift
//  EcommerceAppKit (iOS)
//
//  Created by Ерсултан Сабырханов on 06.04.2022.
//

import SwiftUI

struct CardsView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                HStack(spacing: 14) {
                    Image(systemName: "creditcard")
                        .font(.title2)
                    
                    VStack(alignment: .leading, spacing: 7) {
                        Text("Visa **** 3490")
                            .font(.title3)
                        
                        Text("Основная карта")
                            .font(.system(size: 15))
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    Button {
                        
                    } label: {
                        Image(systemName: "xmark")
                            .font(.title2)
                            .foregroundColor(.gray)
                    }
                }
                .padding()
                
                Divider()
                
                HStack(spacing: 14) {
                    Image(systemName: "creditcard.trianglebadge.exclamationmark")
                        .font(.title2)
                    
                    Button {
                        
                    } label: {
                        Text("Добавить карту")
                            .font(.title3)
                            .foregroundColor(.black)
                    }
                }
                .padding()
                
                Spacer()
            }
            .navigationBarHidden(true)
        }
    }
}

struct CardsView_Previews: PreviewProvider {
    static var previews: some View {
        CardsView()
    }
}
