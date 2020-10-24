//
//  ContentView.swift
//  AppleCard
//
//  Created by Mohammad Azam on 4/27/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ApplyCreditCardViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter a task", text: $viewModel.name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .accessibility(identifier: "nameTextField")
                
                TextField("Enter ssn", text: $viewModel.ssn)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .accessibility(identifier: "ssnTextField")
                
                TextField("Enter dob", text: $viewModel.dob)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .accessibility(identifier: "dobTextField")
                
                Button("Apply") {
                    self.viewModel.apply()
                }
                .accessibility(identifier: "applyButton")
                .frame(width: 100, height: 44, alignment: .center)
                .background(Color.green)
                .cornerRadius(5)
                .padding()
                .foregroundColor(.white)
                .font(Font.system(size: 17, weight: .semibold, design: .default))
                
                Text(viewModel.message)
                    .accessibility(identifier: "messageLabel")
                Spacer()
            }
            .padding()
            .navigationBarTitle("Apply for Card")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
