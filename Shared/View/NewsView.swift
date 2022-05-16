//
//  NewsView.swift
//  EcommerceAppKit (iOS)
//
//  Created by Ерсултан Сабырханов on 06.04.2022.
//

import SwiftUI

struct NewsView: View {
    var body: some View {
        NavigationView {
            List(0..<10) { news in
                VStack(alignment: .leading ,spacing: 5) {
                    Text("Весенние новинки")
                        .font(.title3)
                    
                    Button {
                        
                    } label: {
                        Text("Перейти")
                            .font(.subheadline)
                            .foregroundColor(Color("Purple"))
                    }
                }
            }
            .navigationBarHidden(true)
            .navigationBarTitle("Новости")
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
