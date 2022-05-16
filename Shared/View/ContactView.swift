//
//  ContactView.swift
//  EcommerceAppKit (iOS)
//
//  Created by Ерсултан Сабырханов on 06.04.2022.
//

import SwiftUI

struct ContactView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                VStack(alignment: .leading, spacing: 5) {
                    Text("Телефон")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                    
                    Text("8-707-999-9998")
                        .foregroundColor(Color("Purple"))
                    
                    Text("для вопросов или получения деловой документации")
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(
                    Color.white
                        .cornerRadius(12)
                )
                .padding(.trailing, 23)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Юридический адрес")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                    
                    Text("Назарбаева 139,Республика Казахстан, г. Нур-Султан")
                        .foregroundColor(Color("Purple"))
                    

                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(
                    Color.white
                        .cornerRadius(12)
                )

                
                
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
            
                Color("HomeBG")
                    .ignoresSafeArea()
            )
            .navigationTitle("Свяжитесь с нами")
            .navigationBarHidden(true)
            
        }
        
    }
}

struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        ContactView()
    }
}
