//
//  ContentView.swift
//  Shared
//
//  Created by Ersultan on 26/11/21.
//

import SwiftUI

struct ContentView: View {
    // Log Status..
    @AppStorage("log_Status") var log_Status: Bool = true
    var body: some View {
        Group{
            if log_Status{
                OnBoardingPage()
            }
            else{
                MainPage()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
